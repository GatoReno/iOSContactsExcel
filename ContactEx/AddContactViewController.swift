//
//  AddContactViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit
import ContactsUI
import Contacts

class AddContactViewController: UIViewController {

    var name: String?
    var lastName: String?
    var email: String?
    var phone: String?
    
    @IBOutlet weak var contactNameTextField: UITextField!
    
    @IBOutlet weak var contactLastNameTextField: UITextField!
    
    @IBOutlet weak var contactEmailTextField: UITextField!
    
    @IBOutlet weak var contactPhoneTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        checkValues()
    }
    
    func checkValues(){
        name = contactNameTextField.text
        lastName = contactLastNameTextField.text
        email = contactEmailTextField.text
        phone = contactPhoneTextField.text
        
        if  name == ""{
            contactNameTextField.becomeFirstResponder()
        }
        else if phone == ""{
            contactPhoneTextField.becomeFirstResponder()
        }
        else{
            let store = CNContactStore()
                  let contact = CNMutableContact()

                  // Name
                  contact.givenName = name ?? ""
                  

                  // Phone
                  contact.phoneNumbers.append(CNLabeledValue(
                      label: "mobile", value: CNPhoneNumber(stringValue: phone ?? "")))

                  // Save
                  let saveRequest = CNSaveRequest()
                  saveRequest.add(contact, toContainerWithIdentifier: nil)
                  try? store.execute(saveRequest)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
