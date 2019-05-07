//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Hayden Hastings on 5/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkboxButtonPressed(_ sender: Any) {
        
    }
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
}
