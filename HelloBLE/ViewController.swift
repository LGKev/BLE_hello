//
//  ViewController.swift
//  HelloBLE
//
//  Created by Kevin Kuwata on 6/1/17.
//  Copyright © 2017 Kevin Kuwata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bleManager: BLEManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bleManager = BLEManager()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

