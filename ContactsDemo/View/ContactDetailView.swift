//
//  ContactDetailView.swift
//  ContactsDemo
//
//  Created by Xing Zhao on 2021/4/28.
//

import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    var body: some View {
        VStack(alignment:.leading,spacing:10) {
            Text(contact.name)
                .font(.system(size: 20,weight: .bold))
            Text(contact.mobile)
                .font(.system(size:16,weight: .regular))
            Text(contact.occupation)
                .font(.system(size: 16,weight: .semibold))
        }
        .padding(18)
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .leading)
        .background(Color.init(UIColor.systemGray6))
        .cornerRadius(8)        
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: .init(name: "Xing", mobile: "778****", occupation: "Developer"))
    }
}
