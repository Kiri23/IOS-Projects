//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Christian Nogueras on 05/01/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation
class DevilWizard: Enemy{
    
    override var loot: [String]{
        return ["Magic Wand","Dark Amulet","Salted Pork"]
    }
    
    override var type: String{
        return "Devil Wizard"
    }
    
}