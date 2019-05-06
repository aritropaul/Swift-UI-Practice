//
//  ViewController.swift
//  Day 2
//
//  Created by Aritro Paul on 06/05/19.
//  Copyright © 2019 Aritropaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let itemNames = ["Don't Make Me Think", "Designing for Interaction","Thinking, Fast and Slow","About Face","The Humane Interface","The War of Art","Tools of Titans"]
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        cell.itemName.text = itemNames[indexPath.row]
        return cell
    }
    
    
}

