//
//  ContactHomeView.swift
//  ContactsDemo
//
//  Created by Xing Zhao on 2021/4/28.
//

import SwiftUI

struct ContactHomeView: View {
    //whether present a modal view or not
    @State var isPresented = false
    @StateObject var viewModel = ContactViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.contactList.isEmpty{
                    Text("No Contacts")
                     .font(.system(size: 16,weight: .bold))
                     Text("It seems that you have no contacts, try to add a new one.")
                         .multilineTextAlignment(.center)
                         .font(.system(size: 13,weight: .regular))
                         .padding(.horizontal,18)
                         .padding(.top,6)
                } else {
                    ScrollView{
                        LazyVGrid(columns:[GridItem(.flexible())],spacing:6){
                            ForEach(viewModel.contactList){ item in
                                ContactDetailView(contact: item)
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Contacts")
            .navigationBarItems(trailing: Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "plus")
                    .renderingMode(.original)
            }))
            /*
            .sheet(isPresented: $isPresented, content: {
                AddContactView(isPresented: $isPresented)
            })*/
            //If you want to present a fullscreen, use the modifier below
            .fullScreenCover(isPresented: $isPresented, content: {
                AddContactView(viewModel: viewModel)
            })
        }
    }
}

struct ContactHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContactHomeView()
    }
}
