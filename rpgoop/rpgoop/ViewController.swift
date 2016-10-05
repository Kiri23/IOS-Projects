//
//  ViewController.swift
//  rpgoop
//
//  Created by Christian Nogueras on 05/01/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player2!
    var enemy: Enemy!
    var chestMessage: String?
    var isChestButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player2(name: "Kiri_23", hp: 100, attackPwr: 10)
        //generateRandomPlayer()
        playerHpLbl.text = "\(player.hp)HP"
        generateRandomEnemy()
        enemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(UInt32(2)))
            if rand == 0{
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            }else{
            enemy = DevilWizard(startingHp: 50, attackPwr: 15)
        }
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "Press the Attack Button"
        isChestButtonTapped = false
    }
    
    
//    func generateRandomPlayer(){
//        let rand = Int(arc4random_uniform(UInt32(2)))
//        if rand == 0{
//            player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
//        }else {
//            player = Player2(name: "Kiri_23", hp: 100, attackPwr: 10)
//        }
//        
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        isChestButtonTapped = true
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        if(enemy.attemptAttack(player.attackPwr) && enemy.isAlive ){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        }else if (enemy.isAlive){
            printLbl.text = "Attack was unsuccesful!"
        }
        
        if let loot = enemy.dropLoot(){
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
        }
        
        if !enemy.isAlive && !isChestButtonTapped  {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type) "
            enemyImg.hidden = true
            chestBtn.hidden = false
            
        }
        
        
    }
    


}

