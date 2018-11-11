//
//  File.swift
//  Content
//
//  Created by Zac on 2018-10-25.
//  Copyright © 2018 Zac Cressman. All rights reserved.
//

import Foundation

class FearPong
{
    var cups = [Cup]()
    var dareChoices = ["Take a shot","Steal someones drink and one touch it", "Arm Wrestle the opponent", "Sign the National Anthem", "Let the opponent punch you in the gut","do 5 pushups"]
    let dareCompleted = "Good work but if they hit this cup again you have to drink it"
    let dareNotCompleted = "You lose this cup, DRINK!!!!!"
    
    func hitCup(at index: Int){
        if cups[index].hasBeenHit == true {
            cups[index].outOfPlay = true
        } else {
            cups[index].hasBeenHit = true
        }
    }
    
    init(numberOfCups: Int) {
        for _ in 1...numberOfCups{
            let cup = Cup()
            cups += [cup]
        }
    }
    
}
