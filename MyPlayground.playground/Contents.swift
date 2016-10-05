//
//  ViewController.swift
//  jjj
//
//  Created by Christian Nogueras on 02/06/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonaction(sender: AnyObject) {
        label.text = "buton"
    }
    @IBAction func action(sender: AnyObject) {
        label.hidden = false
        
        
    }
    @IBAction func Uislider(sender: AnyObject) {
        label.hidden = true
    }
    @IBAction func segmented(sender: AnyObject) {
        label.text = "mio"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

