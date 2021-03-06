//
//  Score.swift
//  Swift-Project
//
//  Created by Alex sechi on 10/03/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import Foundation

// Classe qui nous permet de récuperer le score final

class Score {
    
    struct Static {
        static var myScore: NSTimeInterval = NSTimeInterval()
    }
    
    class var myScore: NSTimeInterval {
        get { return Static.myScore }
        set { Static.myScore = newValue }
    }
}
