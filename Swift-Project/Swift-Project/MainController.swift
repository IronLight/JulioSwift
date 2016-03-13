//
//  MainController.swift
//  Swift-Project
//
//  Created by Nathan Maillard on 23/02/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        orientation()
    }
    
    // Bloque la vue en mode portrait
    func orientation()
    {
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }

    // Lors du clique sur le bouton play lance le timer et fait passer à la vue suivante
    @IBAction func Play(sender: AnyObject) {
        GlobalTimer.Static.myCounter = 0
        GlobalTimer.Static.myTimer.invalidate()
        GlobalTimer.Static.mySecondTimer.invalidate()
        GlobalTimer.Static.myTimer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("popupResult"), userInfo: nil, repeats: false)
    }
    
    // Lorsque le timer atteint 30 secondes, affiche "Perdu" et retour au menu
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
}


