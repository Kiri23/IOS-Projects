//
//  DragImg.swift
//  MyLittleMonster
//
//  Created by Christian Nogueras on 07/12/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView{
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
    }
    
    // set- es un data structure como un array
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center // cojjer las cordenadas del centro de la imagen que se este tocando 
        
        
    }
    
    // lo que hace el codigo de esta funcion es coger el primer objeto que se toco
    // 2) coger la posicion del objeto que se esta moviendo 
    // 3) mover el UImage a la posicion que el usuario lo este moviendo(que se coge en el paso #2)
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{ // si hubo un primer touch. Grabar the very first Object que se toco
                                      // se hacen en if pq puede tener un valor al igual que no puede tener ningun valor
            let position = touch.locationInView(self.superview) // to know the position of the object in superview. where the user tap a object
            self.center = CGPointMake(position.x, position.y) // move the UImageView to the current Position
            
        }// end if 
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget{ // if there's values in both let then go to the body of the if
            let position = touch.locationInView(self.superview) // grab the position of the object
            
            if CGRectContainsPoint(target.frame, position){ // return whether a rectangle contain a single point
                NSNotificationCenter.defaultCenter().postNotification(NSNotification (name: "onTargetDropped", object: nil))
            }
        } // end if
        self.center = originalPosition
        
        
        
        
        
    }
    
    
} // end class