//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Hayden Hastings on 5/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    private func updateViews() {
        guard let book = book else { return }
        
        bookLabel.text = book.title
        if book.hasBeenRead == true {
            checkboxButton.setImage(UIImage(named: "checked"), for: .normal)
        }   else {
            checkboxButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
    }
    
    @IBAction func checkboxButtonPressed(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    weak var delegate: BookTableViewCellDelegate?
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
}
