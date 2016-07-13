//
//  ViewController.swift
//  xmlLayoutTest
//
//  Created by jason debottis on 7/7/16.
//  Copyright © 2016 jason debottis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let layoutGenerator = LayoutGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutGenerator.generateUIElements(self.view, layout: "testLayout")
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }

