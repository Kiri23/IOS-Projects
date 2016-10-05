//
//  ViewController.swift
//  Multiples App Exercise
//
//  Created by Christian Nogueras on 04/11/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    let maxAddSum = 50
    var sumNumber = 0
    var accum = 0
    var result = 0
    
    //IBOutlets
    @IBOutlet weak var multiplesImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addtoaddLabel: UILabel!
    @IBOutlet weak var addButon: UIButton!
    
    @IBAction func onPlayButtonPressed(sender: UIButton){
        
        if textField.text != nil && textField.text != "" {
            multiplesImage.hidden = true
            textField.hidden = true
            playButton.hidden = true
            addtoaddLabel.hidden = false
            addButon.hidden = false
            sumNumber = Int(textField.text!)!
            
        }
        
    }
    
    @IBAction func onAddButtonPressed(sender: UIButton){
        result = sumNumber + accum
        addtoaddLabel.text = "\(accum) + \(sumNumber) = \(result)"
        accum += sumNumber
        
        print("result \(result) y maxAddSum \(maxAddSum) fuera del if ")
        if isGameOver(){
            print("result \(result) y maxAddSum \(maxAddSum) dentro del if")
            restartGame()
            
        }
    }
    
    
    func restartGame() {
        accum = 0
        result = 0
        addtoaddLabel.text = "Press ADD to add"
        textField.text = " "
        multiplesImage.hidden = false
        textField.hidden = false
        playButton.hidden = false
        addtoaddLabel.hidden = true
        addButon.hidden = true
        
    }
    
    func isGameOver() -> Bool {
        if result >= maxAddSum {
            return true
        }
        return false
    }
    
}

