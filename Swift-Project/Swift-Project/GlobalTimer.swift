//
//  GlobalTimer.swift
//  Swift-Project
//
//  Created by Alex Sechi and Julien Gerphagnon on 09/03/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import Foundation

// Classe qui nous permet d'avoir une variable statique dans toute l'application.

class GlobalTimer {
    
    struct Static {
        static var myTimer: NSTimer = NSTimer()
        static var mySecondTimer: NSTimer = NSTimer()
        static var myCounter: Int = 0
        static var remainingTimeInterval: Double = 0
    }
    
    class var myTimer: NSTimer {
        get { return Static.myTimer }
        set { Static.myTimer = newValue }
    }
    
    class var mySecondTimer: NSTimer {
        get { return Static.mySecondTimer }
        set { Static.mySecondTimer = newValue }
    }
    
    class var myCounter: Int {
        get { return Static.myCounter }
        set { Static.myCounter = newValue }
    }
    
    class var remainingTimeInterval: Double {
        get { return Static.remainingTimeInterval }
        set { Static.remainingTimeInterval = newValue }
    }
}
