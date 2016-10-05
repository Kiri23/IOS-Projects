//
//  ViewController.swift
//  Calculator_App
//
//  Created by Christian Nogueras on 04/16/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Substract = "-"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueStr = ""
    var rightValueStr = ""
    var currentOperation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let error as NSError {
            print(error.debugDescription)
        }
        
        
    }

    @IBAction func onButtonPressed(btn: UIButton!){
        PlaySound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
        
        
    }
    
    @IBAction func onClearPressed(btn: UIButton!){
        PlaySound()
        clear()
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        proccesOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
         proccesOperation(Operation.Multiply)
    }
    
    @IBAction func onSubstractPressed(sender: AnyObject) {
         proccesOperation(Operation.Substract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
         proccesOperation(Operation.Add)
    }
    
    @IBAction func OnEqualPressed(sender: AnyObject) {
         proccesOperation(currentOperation)
    }
    
    func clear (){
        currentOperation = Operation.Empty
        runningNumber = ""
        outputLbl.text = "0"
        leftValueStr = ""
        rightValueStr = ""
        result = ""
        
    }
    func proccesOperation(op: Operation){
        PlaySound()
        
        if (currentOperation != Operation.Empty){
            if runningNumber != ""{
                rightValueStr = runningNumber
                runningNumber = ""
                
                if (currentOperation == Operation.Multiply){
                    result = "\(Double(leftValueStr)! * Double(rightValueStr)!)"
                }
                else if (currentOperation == Operation.Divide){
                    result = "\(Double(leftValueStr)! / Double(rightValueStr)!)"
                }
                else if (currentOperation == Operation.Add){
                    result = "\(Double(leftValueStr)! + Double(rightValueStr)!)"
                }
                else if (currentOperation == Operation.Substract){
                    result = "\(Double(leftValueStr)! - Double(rightValueStr)!)"
                }
                leftValueStr = result
                outputLbl.text = result
            }
            
            currentOperation = op
        }else{
            leftValueStr = runningNumber
            runningNumber = ""
            currentOperation = op

        }
        
        
        
    }
    
    func PlaySound(){
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

