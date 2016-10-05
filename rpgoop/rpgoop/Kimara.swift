//
//  Kimara.swift
//  rpgoop
//
//  Created by Christian Nogueras on 05/01/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let INMUNE_MAX = 15
    
    override var loot: [String]{
        return ["Tough Hide","Kimara Venom","Rare Trident"]
    }
    
    override var type: String{
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= INMUNE_MAX{
            return super.attemptAttack(attackPwr)
        }else {
            return false
        }
    }
    
}
