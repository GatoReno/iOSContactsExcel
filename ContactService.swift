//
//  ContactService.swift
//  ContactEx
//
//  Created by ed on 10/20/21.
//

import Foundation


class ContactService  {
    var store: CNContactStore!
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
}
