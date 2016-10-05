//
//  Player.swift
//  rpgoop
//
//  Created by Christian Nogueras on 05/01/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation

class Player: Character{
    private var _name = "player"
    
    var name: String{
        get{
            return _name
        }
    }
    
    private var _inventory = [String] ()
    
    var inventory: [String]{
        get{
            return _inventory
        }
    }
    
    func addItemToInventory(item: String){
        _inventory.append(item)
        
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int){
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
        
        
    }
    
}