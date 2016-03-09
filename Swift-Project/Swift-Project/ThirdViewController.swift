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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView2.minimumZoomScale = 1.0
        self.scrollView2.maximumZoomScale = 6.0
        
        scrollView2.userInteractionEnabled = true
        elementClickable2.userInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "TapAction2")
        
        elementClickable2.addGestureRecognizer(tapGesture)
    }
    
    func TapAction2(gestuRecognizer: UITapGestureRecognizer)
    {
        let alertController2 = UIAlertController(title: "iOScreator", message:
            "Good job!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController2.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        self.presentViewController(alertController2, animated: true, completion: nil)
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