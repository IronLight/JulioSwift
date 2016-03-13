//
//  SecondViewController.swift
//  Swift-Project
//
//  Created by Nathan Maillard on 24/02/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //Mes propriétés
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var elementClickable: UIImageView!
    @IBOutlet weak var superView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    var timer = NSTimer()
    var alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.hidden = true
        
        oriantation()
        
        //Definition des valeurs min et max du zoom de la scrollView
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
        //Permet de rendre mes éléments intéragible avec l'utilisateur
         elementClickable.userInteractionEnabled = true
        scrollView.userInteractionEnabled = true
        
        //Ajout d'une action au click sur Nicolas Cage
        let imageRecognized = UITapGestureRecognizer(target: self, action: "TapViewAction:")
        
        elementClickable.addGestureRecognizer(imageRecognized)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "StartTapCoolDown:")
        
        tapGesture.numberOfTapsRequired = 1
        
        superView.addGestureRecognizer(tapGesture)
        
        
        let fireDate = GlobalTimer.Static.myTimer.fireDate
        let nowDate = NSDate()
        let remainingTimeInterval = nowDate.timeIntervalSinceDate(fireDate)
        
        self.title = String(remainingTimeInterval as Double)
        
        dispatch_async(dispatch_get_main_queue()) {
            let fireDate = GlobalTimer.Static.myTimer.fireDate
            let nowDate = NSDate()
            let remainingTimeInterval = nowDate.timeIntervalSinceDate(fireDate)
            
            self.title = String(remainingTimeInterval as Double)
        }
        
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
    
    //Fonction permettant d'attribuer la superview au scrollView pour le zoom
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.superView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    //Action effectué lors du click sur Nicolas Cage
    func TapViewAction(gestuRecognizer: UITapGestureRecognizer)
    {
            let alertController = UIAlertController(title: "Bravo", message:
                "Passe au level suivant", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
            self.presentViewController(alertController, animated: true, completion: nil)
        
        button.hidden = false

    }

    
    //Script permettant de bloquer l'orientation en landscape pour cette vue
    //Appeler au chargement de la vue
    func oriantation()
    {
        let value = UIInterfaceOrientation.LandscapeRight.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    //Permet la rotation de la vue
    override func shouldAutorotate() -> Bool {
        return true;
    }
    
}