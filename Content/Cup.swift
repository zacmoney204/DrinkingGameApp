//
//  Cup.swift
//  Content
//
//  Created by Zac on 2018-10-25.
//  Copyright © 2018 Zac Cressman. All rights reserved.
//

import Foundation

struct Cup
{
    var hasBeenHit = false
    var outOfPlay = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Cup.identifierFactory
        }
    
    init() {
        self.identifier = Cup.getUniqueIdentifier()
    }

}

