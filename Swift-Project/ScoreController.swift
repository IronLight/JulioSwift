//
//  ThoufffController.swift
//  Swift-Project
//
//  Created by Alex sechi on 09/03/2016.
//  Copyright © 2016 Nathan Maillard. All rights reserved.
//

import UIKit

class ScoreController: UIViewController {
    
    @IBOutlet weak var TheScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cache le boutton de retour de la vue.
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        // Plus le temps passe, moins le score sera élevé. (Max 60 000)
        let TimerScore: Double = (30 - Score.Static.myScore) * 1000
        
        // Affiche le score
        TheScore.text = "Ton score est : \(String(format: "%.0f", TimerScore))"
    }
    
}

