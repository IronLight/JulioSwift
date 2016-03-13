//
//  ViewController.swift
//  Swift-Project
//
//  Created by Nathan Maillard on 23/02/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var superView2: UIView!
    @IBOutlet weak var elementClickable2: UIImageView!
    @IBOutlet weak var buttonScore: UIButton!
    
    var timer = NSTimer()
    var alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Affiche le timer dans le titre
        if GlobalTimer.Static.myCounter > 9 {
            
            self.title = "\(GlobalTimer.Static.myCounter)"
            
        }
        else {
            
            self.title = "0\(GlobalTimer.Static.myCounter)"
        }
        
        // Remet en marche les deux Timers
        GlobalTimer.Static.myTimer = NSTimer.scheduledTimerWithTimeInterval( GlobalTimer.Static.remainingTimeInterval, target: self, selector: Selector("popupResult"), userInfo: nil, repeats: true)
        
        GlobalTimer.Static.mySecondTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counter"), userInfo: nil, repeats: true)
        
        
        //
        buttonScore.hidden = true
        
        // Gere le zoom
        self.scrollView2.minimumZoomScale = 1.0
        self.scrollView2.maximumZoomScale = 6.0
        
        scrollView2.userInteractionEnabled = true
        elementClickable2.userInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "TapAction2:")
        
        elementClickable2.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: "StartTapCoolDown:")
        
        tapGesture2.numberOfTapsRequired = 1
        
        superView2.addGestureRecognizer(tapGesture2)
    }
    
    // Lorsque le timer atteint 30 secondes un messages s'affiche "Perdu" et retour au menu
    func popupResult(){
        let alert = UIAlertController(title: "Perdu", message: "Temps écoulé", preferredStyle: .Alert)
        
        let firstAction = UIAlertAction(title: "Accueil", style: .Default){
            (action) in if let navController = self.navigationController{
                navController.popViewControllerAnimated(true)
                navController.popViewControllerAnimated(true)
            }
            
        }
        alert.addAction(firstAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    //Action effectué lors du click sur l'écran
    func StartTapCoolDown(gestuRecognizer: UITapGestureRecognizer)
    {
        alertController = UIAlertController(title: "Perdu !", message:
            "Veuillez attendre 2 secondes pour réessayer", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "DeleteAlertController", userInfo: nil, repeats: false)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    // Affiche le bouton Ok de la popup
    func DeleteAlertController()
    {
        alertController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func TapAction2(gestuRecognizer: UITapGestureRecognizer)
    {
        let alertController = UIAlertController(title: "Bravo", message:
            "Découvre ton score !", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        buttonScore.hidden = false
        
        let fireDate = GlobalTimer.Static.myTimer.fireDate
        let nowDate = NSDate()
        let remainingTimeInterval = nowDate.timeIntervalSinceDate(fireDate)
        
        Score.Static.myScore = remainingTimeInterval
        
        GlobalTimer.Static.myTimer.invalidate()
        GlobalTimer.Static.mySecondTimer.invalidate()
    }
    
    func counter() {
        
        ++GlobalTimer.Static.myCounter
        // 9
        if GlobalTimer.Static.myCounter > 9 {
            
            self.title = "\(GlobalTimer.Static.myCounter)"
            
        }
        else {
            
            self.title = "0\(GlobalTimer.Static.myCounter)"
        }
        
        if GlobalTimer.Static.myCounter == 30 {
            GlobalTimer.Static.mySecondTimer.invalidate()
        }
    }
    
    func oriantation()
    {
        let value = UIInterfaceOrientation.LandscapeRight.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    override func shouldAutorotate() -> Bool {
        return true;
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.superView2
    }
    
}