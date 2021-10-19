//
//  ViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        //navigate
        self.performSegue(withIdentifier:"goToAddContact", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

