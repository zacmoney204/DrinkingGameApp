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
    var i = 0
    
    lazy var game = FearPong(numberOfCups: cupArray.count)
        
    @IBOutlet weak var dareLabel: UILabel!
    @IBOutlet var cupArray: [UIButton]!
    @IBOutlet weak var dareStatus: UILabel!
    @IBOutlet weak var yesOutlet: UIButton!
    @IBOutlet weak var noOutlet: UIButton!
  
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        cupIndex = cupArray.index(of: sender)!
        
        if game.cups[cupIndex].outOfPlay == false {
            dareLabel.text = game.dareChoices[cupIndex]
            flipCup(on: sender)
        }
    }
    
    func flipCup(on button: UIButton ){
        if game.cups[cupIndex].hasBeenHit == false {
            cupState(setState: false)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                dareVisability(setState: false)
                game.hitCup(at: cupIndex)
        } else {
            loseCup()
        }
    }
    
    @IBAction func yesDare(_ sender: UIButton) {
        cupArray[cupIndex].backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        dareLabel.text = "Good work but if they hit this cup again you have to drink it"
        viewDidLoad()
        cupState(setState: true)
       
    }
    
    @IBAction func noDare(_ sender: UIButton) {
        dareVisability(setState: true)
        loseCup()
    }
    
    func loseCup(){
        cupArray[cupIndex].backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        dareLabel.text = "You lose this cup, DRINK!!!!!"
        cupState(setState: true)
        game.cups[cupIndex].outOfPlay = true
    }
    
    func cupState (setState state: Bool){
        repeat {
            cupArray[i].isEnabled = state
            i = i + 1
        } while i < cupArray.count
        i = 0
    }

    func dareVisability(setState state: Bool){
        dareStatus.isHidden = state
        yesOutlet.isHidden = state
        noOutlet.isHidden = state
    }


}

