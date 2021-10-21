//
//  ViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit

class ViewController: UIViewController {

    var name: String?
    

    var contacts = [FetchedContact]()
    
    @IBOutlet weak var addButton: UIButton!
   
    
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBAction func addButtonAction(_ sender: UIButton) {
        //navigate
        self.performSegue(withIdentifier:"goToAddContact", sender: self)
    }
    
    
    var contactVC = AddContactViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactVC.getContacts()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }

    
    func fetchContacts() {
        contactVC.getContacts()
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched me!")
    }
    
}

extension ViewController : UITableViewDataSource{
    
  

  
    //set number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactVC.contacts.count
    }
    
    // set cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath )
        cell.textLabel?.text = "\(contactVC.contacts[indexPath.row].firstName) \(contactVC.contacts[indexPath.row].lastName) \(contactVC.contacts[indexPath.row].telephone)"
        
        return cell
    }
}



