//
//  ViewController.swift
//  AutoLayouts_Advanced part2
//
//  Created by Christian Nogueras on 04/11/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var rocketImage: UIImageView!
    var isMoving = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveRocket(sender: AnyObject) {
        isMoving = true
        if(isMoving){
            var xPos = rocketImage.frame.origin.x
            print("Estoy en el loop ")
            xPos += xPos
        }
        
        print("sali del loop ")
    }
    
    @IBAction func StopRocket(sender: AnyObject) {
        isMoving = false
        print("butoon stop \(isMoving)")
    }


}

