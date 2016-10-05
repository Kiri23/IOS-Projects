//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Christian Nogueras on 04/11/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    
    @IBAction func onCoinButtonPressed(sender: UIButton){
        
        currentTaps = currentTaps + 1
        
        updateTapsLabel()
        print("\(maxTaps)")
        if isGameOver(){
            restartGame()
        }
    }
    
    
    @IBAction func onPlayButtonPressed(sender: UIButton){
        
        if  howManyTapsTxt.text != nil && self.howManyTapsTxt.text != "" {
            self.logoImg.hidden = true
            self.howManyTapsTxt.hidden=true
            self.playBtn.hidden=true
            self.tapBtn.hidden = false
            self.tapsLabel.hidden = false
            
            self.maxTaps = Int(self.howManyTapsTxt.text!)!
            self.currentTaps = 0
            
            updateTapsLabel()
            
        }
        
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapsTxt.text = ""
        print("\(currentTaps) ")
        self.logoImg.hidden = false
        self.howManyTapsTxt.hidden=false
        self.playBtn.hidden=false
        self.tapBtn.hidden = true
        self.tapsLabel.hidden = true
        
    }
    
    func isGameOver() -> Bool{
        if(currentTaps >= maxTaps){
            return true
            
        }
        return false
    }
    
    func updateTapsLabel(){
        self.tapsLabel.text = "\(self.currentTaps) Taps"
        
    }
    
    
    
    
}

