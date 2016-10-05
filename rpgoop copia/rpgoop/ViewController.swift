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
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    @IBOutlet weak var enemyAttackBtn: UIButton!
    @IBOutlet weak var playerAttackBtn: UIButton!
    
    private var player: Player2!
    private var enemy: Enemy!
    private var chestMessage: String?
    private var isChestButtonTapped = false
    //private var isAttackAvaible = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player2(name: "Kiri_23", hp: 100, attackPwr: 18)
        playerHpLbl.text = "\(player.hp) HP"
        generateRandomEnemy()
        enemyHpLbl.text = "\(enemy.hp) HP"
        enemyAttackBtn.enabled = false
    }
    
    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(UInt32(2)))
            if rand == 0{
            enemy = Kimara(startingHp: 100, attackPwr: 12)
            }else{
            enemy = DevilWizard(startingHp: 100, attackPwr: 15)
        }
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "Press the Attack Button"
        isChestButtonTapped = false
    }
    
    
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
    
    @IBAction func playerAttackTapped(sender: AnyObject) {
        if(enemy.attemptAttack(player.attackPwr) && enemy.isAlive ){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
            isAttackAvaible()
            
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
    
    @IBAction func enemyAttackTapped(sender: AnyObject) {
        if(player.attemptAttack(enemy.attackPwr) && player.isAlive){
            printLbl.text = "Attacked \(player.name) for \(enemy.attackPwr) HP"
            playerHpLbl.text = "\(player.hp) HP"
            if (isAttackAvaible()){
                print("estoo es true ")
            }
            else {
                print("esto es falso ")
            }
        }else if (player.isAlive){
            printLbl.text = "Attack eas unsuccesful"
        }
        if !enemy.isAlive {
            playerHpLbl.text = ""
            printLbl.text = "Killed \(player.name) "
            playerImg.hidden = true
            
        }
        
    }
    
    func isAttackAvaible()-> Bool{
        
        if(playerAttackBtn.enabled == true || enemyAttackBtn.enabled == false){
            playerAttackBtn.enabled = false
            enemyAttackBtn.enabled = true ;
            return false
        }else{
        playerAttackBtn.enabled = true
        enemyAttackBtn.enabled = false
        return true
        }
    }
    
    

}


//    func attack(attacker: Character,attacked: Character){
//        if(attacker.attemptAttack(attacked.attackPwr) && attacker.isAlive){
//            printLbl.text = "Attacked \(attacker.)"
//        }
//    }


