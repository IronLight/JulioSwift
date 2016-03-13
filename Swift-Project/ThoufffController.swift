//
//  ThoufffController.swift
//  Swift-Project
//
//  Created by Alex sechi on 09/03/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class ThoufffController: UIViewController {
    
    @IBOutlet weak var TheScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // Ici on essais d'avoir un score assez grand, plus le temps passe et moins le score sera haut. (Max 60 000)
        let TimerScore: Double = (30 - Score.Static.myScore) * 1000
        
        TheScore.text = "Ton score est : \(String(format: "%.0f", TimerScore))"
        
    }
    
}
