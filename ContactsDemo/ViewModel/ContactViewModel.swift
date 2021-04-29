//
//  ContactViewModel.swift
//  ContactsDemo
//
//  Created by Xing Zhao on 2021/4/28.
//

import Combine

final class ContactViewModel: ObservableObject {
    @Published private(set) var contactList = [Contact]()
    
    func addNewContact(_ contact: Contact) {
        contactList.append(contact)
    }
}
