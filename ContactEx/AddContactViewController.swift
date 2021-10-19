//
//  AddContactViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit

class AddContactViewController: UIViewController {

    var name: String?
    var lastName: String?
    var emaail: String?
    var phone: String?
    
    @IBOutlet weak var contactNameTextField: UITextField!
    
    @IBOutlet weak var contactLastNameTextField: UITextField!
    
    @IBOutlet weak var contactEmailTextField: UITextField!
    
    @IBOutlet weak var contactPhoneTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        
    }
    
    func checkValues(){
        
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
