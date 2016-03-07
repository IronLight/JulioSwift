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
    @IBOutlet weak var BoutonNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BoutonNext.hidden = true
        
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
            let alertController = UIAlertController(title: "iOScreator", message:
                "Good job!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
            self.presentViewController(alertController, animated: true, completion: nil)
        
        BoutonNext.hidden = false
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
    
   /* override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //super.touchesBegan(touches, withEvent: event)
        
        let touch = touches.first
        let locationTap = touch?.locationInView(self.view)
        
        let locationTap_X = locationTap?.x
        let locationTap_Y = locationTap?.y
        
        if
        (
            (locationTap_X >= 137 && locationTap_X <= 157)
        &&
            (locationTap_Y >= 345 && locationTap_Y <= 365)
        )
        {
            let alertController = UIAlertController(title: "iOScreator", message:
                "Good job!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Next level", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: locationTap_X?.description, message:
                locationTap_Y?.description, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Next level", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }*/
    
}