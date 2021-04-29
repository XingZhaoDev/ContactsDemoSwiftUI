//
//  Contact.swift
//  ContactsDemo
//
//  Created by Xing Zhao on 2021/4/28.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var mobile: String
    var occupation: String
}
