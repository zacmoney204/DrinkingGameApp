//
//  ViewController.swift
//  Content
//
//  Created by Zac on 2018-10-20.
//  Copyright © 2018 Zac Cressman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        dareStatus.isHidden = true
        yesOutlet.isHidden = true
        noOutlet.isHidden = true
    }
    
    var cupIndex = 0
    let enabledCupColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    let disabledCupColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    lazy var game = FearPong(numberOfCups: cupArray.count)
        
    @IBOutlet weak var dareLabel: UILabel!
    @IBOutlet var cupArray: [UIButton]!
    @IBOutlet weak var dareStatus: UILabel!
    @IBOutlet weak var yesOutlet: UIButton!
    @IBOutlet weak var noOutlet: UIButton!
  
    
    @IBAction func onCupHit(_ sender: UIButton) {
        
        cupIndex = cupArray.index(of: sender)!
        
        if game.cups[cupIndex].outOfPlay == false {
            dareLabel.text = game.dareChoices[cupIndex]
            flipCup(on: sender)
        }
    }
    
    func flipCup(on button: UIButton ){
        if game.cups[cupIndex].hasBeenHit{
            loseCup()
            return
        }
        disableCups()
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        unhideDareLabels()
        game.hitCup(at: cupIndex)
    }
    
    @IBAction func dareCompleted(_ sender: UIButton) {
        cupArray[cupIndex].backgroundColor = enabledCupColor
        dareLabel.text = game.dareCompleted
        viewDidLoad()
        enableCups()
    }
    
    @IBAction func dareNotCompleted(_ sender: UIButton) {
        hideDareLabels()
        loseCup()
    }
    
    func loseCup(){
        cupArray[cupIndex].backgroundColor = disabledCupColor
        dareLabel.text = game.dareNotCompleted
        enableCups()
        game.cups[cupIndex].outOfPlay = true
    }
    
    func disableCups(){
        cupArray.forEach { cup in
            cup.isEnabled = false
        }
    }
    
    func enableCups(){
        cupArray.forEach { cup in
            cup.isEnabled = true
        }
    }

    func unhideDareLabels(){
        dareStatus.isHidden = false
        yesOutlet.isHidden = false
        noOutlet.isHidden = false
    }

    func hideDareLabels(){
        dareStatus.isHidden = true
        yesOutlet.isHidden = true
        noOutlet.isHidden = true
    }
    
}


