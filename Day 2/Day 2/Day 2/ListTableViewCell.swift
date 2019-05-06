//
//  ListTableViewCell.swift
//  Day 2
//
//  Created by Aritro Paul on 06/05/19.
//  Copyright © 2019 Aritropaul. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var itemName: UILabel!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkedTapped(_ sender: Any) {
        if isChecked == false {
            isChecked = true
            checkBox.setImage(UIImage(named: "Ticked"), for: .normal)
            itemName.textColor = UIColor(red: 206/255, green: 206/255, blue: 213/255, alpha: 1)
        }
        else {
            isChecked = false
            checkBox.setImage(UIImage(named: "Unticked"), for: .normal)
            itemName.textColor = UIColor(red: 31/255, green: 32/255, blue: 65/255, alpha: 1)
        }
    }
    
}
