//
//  GlobalTimer.swift
//  Swift-Project
//
//  Created by Alex Sechi and Julien Gerphagnon on 09/03/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import Foundation

class GlobalTimer {
    
    struct Static {
        static var myTimer: NSTimer = NSTimer()
    }
    class var myTimer: NSTimer {
        get { return Static.myTimer }
        set { Static.myTimer = newValue }
    }
}
