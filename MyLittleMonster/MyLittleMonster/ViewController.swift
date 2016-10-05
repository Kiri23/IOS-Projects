//
//  ViewController.swift
//  MyLittleMonster
//
//  Created by Christian Nogueras on 07/12/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg:MonsterImg!
    @IBOutlet weak var fooImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAGUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fooImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        
       NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        loadMusic()
        startTimer()
       
        
    } // end viewDidLoad Method
    
    func loadMusic(){
        do{
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(
                fileURLWithPath:
                NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(
                fileURLWithPath:
                NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(
                fileURLWithPath:
                NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(
                fileURLWithPath:
                NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(
                fileURLWithPath:
                NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func itemDroppedOnCharacter(notif: AnyObject){
        monsterHappy = true
        startTimer()
        
        fooImg.alpha = DIM_ALPHA
        fooImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        if currentItem == 0 {
            sfxHeart.play()
        }else {
            sfxBite.play()
        }
    }
    
    func startTimer(){
        
        // si hay un timer corriendo
        if timer != nil{
           timer.invalidate() //Before when start a new Timer reset the timer
        }
        // every 3 second is going to call the function changeGameState on this class(target:self) and repeat every 3 second(true)
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
        
    }
    
    func changeGameState(){
        if !monsterHappy { // monsterhappy es false, si esta enojado checkForPenalties
            checkPenalties()
        }
        
        let rand = arc4random_uniform(2) // 0-1 
        if rand == 0{
            fooImg.alpha = DIM_ALPHA
            fooImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAGUE
            heartImg.userInteractionEnabled = true
        }else {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            fooImg.alpha = OPAGUE
            fooImg.userInteractionEnabled = true
        }
        
        currentItem = rand
        
        monsterHappy = false
        
    }
    
    func checkPenalties(){
        penalties = penalties + 1
        sfxSkull.play()
        if penalties == 1 {
            penalty1Img.alpha = OPAGUE
            penalty2Img.alpha = DIM_ALPHA
        } else if penalties == 2 {
            penalty2Img.alpha = OPAGUE
            penalty3Img.alpha = DIM_ALPHA
        }else if penalties >= 3 {
            penalty3Img.alpha = OPAGUE
        }else{
            penalty1Img.alpha = DIM_ALPHA
            penalty2Img.alpha = DIM_ALPHA
            penalty3Img.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES{
            gameOver()
        }
    }
    
    func gameOver(){
        timer.invalidate()
        monsterImg.playDeathAnimation()
        sfxDeath.play()
    }

    
}// end class

