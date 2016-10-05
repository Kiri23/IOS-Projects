//
//  MonsterImg.swift
//  MyLittleMonster
//
//  Created by Christian Nogueras on 07/12/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation() // when the app first load play the idel animation 
    }
    
    func playIdleAnimation(){
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for i in 1..<5 {
            let img = UIImage(named: "idle\(i).png")
            imgArray.append(img!)
        } // end forloop
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation(){
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for i in 1..<6 {
            let img = UIImage(named: "dead\(i).png")
            imgArray.append(img!)
        } // end forloop
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
    
}