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
    var dareChoices = [String]()
    let dareCompleted = "Good work but if they hit this cup again you have to drink it"
    let dareNotCompleted = "You lose this cup, DRINK!!!!!"
    
    
    init(numberOfCups: Int) {
        for _ in 1...numberOfCups{
            let cup = Cup()
            cups += [cup]
        }
    }
    
    func getDaresFromTxtFile(){
        let path = Bundle.main.path(forResource: "DareSet1", ofType: "txt")
        let url = URL(fileURLWithPath:  path!)
        let txtFileContents = try! String(contentsOf: url, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        let dareChoicesFromTxt = txtFileContents.components(separatedBy: .newlines)
        dareChoices.append(contentsOf: dareChoicesFromTxt)
    }
    
    func removeBlankFromDareChoices(){
        for cup in 0..<dareChoices.count {
            if dareChoices[cup] == "" {
                dareChoices.remove(at: cup)
            }
        }
    }
    
    func assignDares(numberOfCups: Int){
        for cup in 0..<numberOfCups{
            dareChoices.shuffle()
            cups[cup].dare = dareChoices[0]
            dareChoices.remove(at: 0)
        }
    }

    func hitCup(at index: Int){
        if cups[index].hasBeenHit == true {
            cups[index].outOfPlay = true
        } else {
            cups[index].hasBeenHit = true
            cups[index].dareDone = true
        }
    }
    
}
