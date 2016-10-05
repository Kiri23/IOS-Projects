//
//  Enemy.swift
//  rpgoop
//
//  Created by Christian Nogueras on 05/01/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation
class Enemy: Character {
    
    var loot: [String]{
        return["Rusty Dragger","Cracked Buckler"]
    }
    var type: String{
        return "Grunt"
    }
    
    func dropLoot() -> String?{
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
   
}

