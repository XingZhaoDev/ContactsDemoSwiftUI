//
//  AddContactView.swift
//  ContactsDemo
//
//  Created by Xing Zhao on 2021/4/28.
//

import SwiftUI

struct AddContactView: View {
    // present modal view (not fullscreen)
    //@Binding var isPresented: Bool
    
    //present a fullscreen view
    @Environment(\.presentationMode) var presentMode
    
    @State var newContact = Contact(name: "", mobile: "", occupation: "")
    @ObservedObject var viewModel:ContactViewModel
    
    func dismissMe() {
        presentMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        // test dismiss
        /*
        Button("Dismiss") {
            presentMode.wrappedValue.dismiss()
        }*/
        NavigationView {
            
            Form {
                Section(header: Text("Your info")){
                    TextField("Name",
                              text:$newContact.name)
                    TextField("Mobile",
                              text:$newContact.mobile)
                    TextField("Occupation",
                              text:$newContact.occupation)
                }
            }
            .navigationTitle("New Contact")
            .navigationBarItems(leading: Button(action: {
                dismissMe()
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
            }), trailing: Button(action: {
                viewModel.addNewContact(newContact)
                dismissMe()
            }, label: {
                Text("Add")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }))
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(viewModel: ContactViewModel())
    }
}
