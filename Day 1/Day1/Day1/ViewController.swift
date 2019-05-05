//
//  ViewController.swift
//  Day1
//
//  Created by Aritro Paul on 04/05/19.
//  Copyright © 2019 Aritropaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = startButton.frame.height/2
    }


}

