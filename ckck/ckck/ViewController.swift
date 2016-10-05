//
//  ViewController.swift
//  ckck
//
//  Created by Christian Nogueras on 02/06/16.
//  Copyright © 2016 Christian Nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var label: UILabel!
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ButtonPush(sender: AnyObject) {
        label.hidden = false;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

