//
//  CategoryView.swift
//  ECommerce
//
//  Created by 이현재 on 10/5/23.
//

import SwiftUI

struct CategoryView: View {
    @State private var isFavorite: Bool = false
    
    var itemList: [Item] = [
        Item(id: "1", image:"applewatch", name: "애플워치", price: 450),
        Item(id: "2", image:"applepencil", name: "애플펜슬", price: 100),
        Item(id: "3", image:"appletv.fill", name: "애플tv", price: 100),
        Item(id: "4", image:"homepodmini.fill", name: "애플홈팟", price: 100),
        Item(id: "5", image:"iphone.gen1", name: "아이폰", price: 100)
    ]
    
    var rows: [GridItem] = Array(repeating: .init(.fixed(50)), count: 1)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, content: {
                ForEach(itemList) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                            .toolbar {
                                ToolbarItem {
                                    Button {
                                        // add favorite list
                                        isFavorite.toggle()
                                    } label: {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(isFavorite ? .pink : .black)
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
                                .foregroundColor(.gray)
                        )
                        .foregroundColor(.primary)
                    }
                }
            })
        }
    }
    
}

#Preview {
    CategoryView()
}
