//
//  CategoryView.swift
//  ECommerce
//
//  Created by 이현재 on 10/5/23.
//

import SwiftUI

struct CategoryView: View {
//    @State private var isFavorite: Bool = false
    
    @StateObject private var manager = ItemManager.shared
        
    var rows: [GridItem] = Array(repeating: .init(.fixed(50)), count: 1)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, content: {
                ForEach(manager.getList()) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                            .toolbar {
                                ToolbarItem {
                                    Button {
                                        manager.toggleWish(item)
                                    } label: {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(item.wish ? .pink : .black)
                                    }
                                }
                            }
                        
                    } label: {
                        VStack {
                            Image(systemName: item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            Text(item.name)
                            Text(item.price.description)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.clear)
                        )
                        .foregroundColor(.primary)
                    }
                }
            })
        }
        .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
