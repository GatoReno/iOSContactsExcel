//
//  AddContactViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit
import ContactsUI
import Contacts

class AddContactViewController: UIViewController , UITextFieldDelegate {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        store = CNContactStore()
        
        contactNameTextField.delegate = self
        contactLastNameTextField.delegate = self
        contactEmailTextField.delegate = self
        contactPhoneTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contactNameTextField.resignFirstResponder()
        contactLastNameTextField.resignFirstResponder()
        contactEmailTextField.resignFirstResponder()
        contactPhoneTextField.resignFirstResponder()
        return true
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
    var contacts = [FetchedContact]()

    func getContacts()
    {
        let store = CNContactStore()
            store.requestAccess(for: .contacts) { (granted, error) in
                if let error = error {
                    print("failed to request access", error)
                    return
                }
                if granted {
                    // 2.
                    let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                    let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                    do {
                        // 3.
                        try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                            self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                            
                            print(self.contacts)
                        })
                    } catch let error {
                        print("Failed to enumerate contact", error)
                    }
                } else {
                    print("access denied")
                }
            }
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

                let workEmail = CNLabeledValue(label:CNLabelWork, value:email! as NSString)
                contact.emailAddresses = [workEmail]
            
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                try store.execute(saveRequest)
                        print("saved")
                        
                        //self.dismiss(animated: true, completion: nil) navigate back
                        showToast(message: "Contact saved")
                    }
                    catch{
                        print("error")
                        let alert = UIAlertController(title: "Error", message: "Something happened pleaase check the values and try again.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
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





