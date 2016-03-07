//
//  ViewController.swift
//  Swift-Project
//
//  Created by Nathan Maillard on 23/02/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var superView: UIView!
    
    @IBOutlet weak var elementClickable: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        oriantation()
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
        /*elementClickable.userInteractionEnabled = true
        scrollView.userInteractionEnabled = true
        
        //Rendre clickable Nicolas Cage
        let imageRecognized = UITapGestureRecognizer(target: self, action: "TapViewAction")
        elementClickable.addGestureRecognizer(imageRecognized)*/
    }
    
    /*func TapViewAction(gestuRecognizer: UITapGestureRecognizer)
    {
    let alertController = UIAlertController(title: "iOScreator", message:
    "Good job!", preferredStyle: UIAlertControllerStyle.Alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
    
    self.presentViewController(alertController, animated: true, completion: nil)
    }*/
    
    //Fonction permettant d'attribuer la superview au scrollView pour le zoom
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
    return self.superView
    }
    
    func oriantation()
    {
    let value = UIInterfaceOrientation.LandscapeRight.rawValue
    UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    override func shouldAutorotate() -> Bool {
    return true;
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
}