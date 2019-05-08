//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Hayden Hastings on 5/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let book = book,
            isViewLoaded else { return }
        
        bookTextView.text = book.reasonToRead
        bookTitleTextField.text = book.title
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
       
    }
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var bookTextView: UITextView!
    
    var bookController: BookController?
    var book: Book?
}
