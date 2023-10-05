//
//  ProfileView.swift
//  ECommerce
//
//  Created by 이현재 on 2023/09/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            List {
                VStack(alignment: .center) {
                    Image(systemName: "bolt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    Text("name")
                    HStack(alignment: .top) {
                        Image(systemName: "bolt")
                        Text("address asdfasdf\nadress\nadress")
                    }
                }.padding()
                
                //                List {
                NavigationLink {
                    Text("Detail")
                } label: {
                    Text("Edit Profile")
                }
                
                //                List {
                NavigationLink {
                    Text("Detail")
                } label: {
                    Text("Shopping address")
                }
                //                }
                //                List {
                NavigationLink {
                    Text("Detail")
                } label: {
                    Text("Order history")
                }
                NavigationLink {
                    Text("Detail")
                } label: {
                    Text("Cards")
                }
                
                NavigationLink {
                    Text("Detail")
                } label: {
                    Text("Notifications")
                }
            }
            .listRowSpacing(30)
            .navigationTitle("My Profile")
            
        }
    
    }
}

#Preview {
    ProfileView()
}
