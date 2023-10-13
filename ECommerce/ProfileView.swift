//
//  ContentView.swift
//  ProfilePractice
//
//  Created by CNU on 2023/10/10.
//

import SwiftUI

struct ProfileView: View {
    @State private var profileImage: Image = Image(systemName: "person.circle.fill")
    @State private var name = "Rosina Doe"
    @State private var address: String = "Chungnam National University, 99 Gung-dong, Yuseong-gu, Daejeon"
    @State private var isActionSheetPresented = false
    
    var body: some View {
        NavigationView {
            ProfileListView(
                profileImage: $profileImage,
                name: $name,
                address: $address,
                isActionSheetPresented: $isActionSheetPresented
            )
            .navigationBarTitle("My Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProfileListView: View {
    @Binding var profileImage: Image
    @Binding var name: String
    @Binding var address: String
    @Binding var isActionSheetPresented: Bool
    
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("")) {
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Text(name)
                            .multilineTextAlignment(.center)
                        HStack(alignment: .top) {
                            Image(systemName: "house")
                                .alignmentGuide(.top, computeValue: { dimension in
                                    dimension[.top]
                                })
                            Text(address)
                        }
                        .padding(10)
                        Spacer()
                    }
                }
                
                NavigationLink(destination: EditProfileView(name: $name, address: $address)) {
                    ProfileListItemView(title: "Edit Profile")
                }
                
                NavigationLink(destination: Text("Shopping Address View")) {
                    ProfileListItemView(title: "Shopping address")
                }
                
                NavigationLink(destination: Text("Order History View")) {
                    ProfileListItemView(title: "Order history")
                }
                
                NavigationLink(destination: Text("Cards View")) {
                    ProfileListItemView(title: "Cards")
                }
                
                NavigationLink(destination: Text("Notifications View")) {
                    ProfileListItemView(title: "Notifications")
                }
            }
            .actionSheet(isPresented: $isActionSheetPresented) {
                ActionSheet(title: Text("Change Profile Photo"), buttons: [
                    .default(Text("Emoji 1")) {
                        profileImage = Image(systemName: "fossil.shell.fill")
                    },
                    .default(Text("Emoji 2")) {
                        profileImage = Image(systemName: "leaf.circle.fill")
                    },
                    .cancel()
                ])
            }
            profileImage
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .onTapGesture {
                    isActionSheetPresented = true
                }
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 25)
        }
    }
}

struct ProfileListItemView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding(10)
    }
}

struct EditProfileView: View {
    @Binding var name: String
    @Binding var address: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
            }
            Section {
                TextEditor(text: $address)
                    .frame(height: 100)
            }
        }
        .navigationBarTitle("Edit Profile")
        .navigationBarItems(
            trailing: Button("Save") {
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
}
