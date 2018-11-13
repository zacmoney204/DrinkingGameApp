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
        game.getDaresFromTxtFile()
        game.removeBlankFromDareChoices()
        game.assignDares(numberOfCups: cupArray.count)
    }
    
    var cupIndex = 0
    let inPlayCupColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    let outOfPlayCupColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    lazy var game = FearPong(numberOfCups: cupArray.count)
        
    @IBOutlet weak var dareLabel: UILabel!
    @IBOutlet var cupArray: [UIButton]!
    @IBOutlet weak var dareStatus: UILabel!
    @IBOutlet weak var yesOutlet: UIButton!
    @IBOutlet weak var noOutlet: UIButton!

    
    
    @IBAction func onCupHit(_ sender: UIButton) {
        cupIndex = cupArray.index(of: sender)!
        if game.cups[cupIndex].outOfPlay == false {
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
        dareLabel.text = game.cups[cupIndex].dare
        unhideDareLabels()
        game.hitCup(at: cupIndex)
    }
    
    @IBAction func dareCompleted(_ sender: UIButton) {
        cupArray[cupIndex].backgroundColor = inPlayCupColor
        cupArray[cupIndex].borderColor = inPlayCupColor
        dareLabel.text = game.dareCompleted
        hideDareLabels()
        enableCups()
    }
    
    @IBAction func dareNotCompleted(_ sender: UIButton) {
        hideDareLabels()
        loseCup()
    }
    
    func loseCup(){
        cupArray[cupIndex].backgroundColor = outOfPlayCupColor
        cupArray[cupIndex].borderColor = outOfPlayCupColor
        dareLabel.text = game.dareNotCompleted
        enableCups()
        game.hitCup(at: cupIndex)
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

