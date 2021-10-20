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
    
    var store: CNContactStore!
    
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
        
        if  name == "" {
             contactNameTextField.becomeFirstResponder()
            showToast(message: "Name missing")
        }
        else if phone == ""{
             contactPhoneTextField.becomeFirstResponder()
            showToast(message: "Phone missing")
        }
        else{
            saveContact()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store = CNContactStore()

        // Do any additional setup after loading the view.
    }
    
    func saveContact(){
        do{
                    let contact = CNMutableContact()
                contact.givenName = name!
                contact.familyName = lastName!
                contact.phoneNumbers = [CNLabeledValue(
                    label:CNLabelPhoneNumberiPhone,
                    value:CNPhoneNumber(stringValue:phone!)),
                          CNLabeledValue(
                        label:CNLabelPhoneNumberiPhone,
                        value:CNPhoneNumber(stringValue:phone!))]

                //let workEmail = CNLabeledValue(label:CNLabelWork, value:email)
                //contact.emailAddresses = [workEmail]


//                let saveRequest = CNSaveRequest()
//            saveRequest.addMember(contact, to: <#T##CNGroup#>)
            
            let saveRequest = CNSaveRequest()
            saveRequest.add(contact, toContainerWithIdentifier: nil)
         
            
            try store.execute(saveRequest)
                    print("saved")
                    showToast(message: "Contact saved")
                }
                catch{
                    print("error")
                    showToast(message: "Something happed")
                }
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



extension UIViewController{
    func showToast(message: String){
        let toast = UILabel(frame: CGRect(
            x: self.view.frame.width/2-75,
            y: self.view.frame.height - 100,
            width: 150, height: 40))
        toast.textAlignment = .center
        toast.backgroundColor = .label
        toast.textColor = .systemBackground
        toast.alpha = 1.0
        toast.layer.cornerRadius = 10
        toast.clipsToBounds = true
        toast.text = message
        self.view.addSubview(toast)
        
        UIView.animate(
            withDuration: 4.0,
            delay: 1.0,
            options: .curveEaseInOut,
            animations: {
                toast.alpha = 0.0
            }) { (isCompleted) in
                toast.removeFromSuperview()
            }
    }
}





