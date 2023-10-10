//
//  FavoriteView.swift
//  ECommerce
//
//  Created by CNU on 2023/09/24.
//

import SwiftUI

struct FavoriteView: View {
    @State private var isFavorite: Bool = true
    let data: [Item] = [Item(id: "1", image:"applewatch", name: "애플워치", model: "Series 6: Red", type: "웨어러블", price: 450),
                        Item(id: "2", image:"applewatch.watchface", name: "갤럭시워치", model: "Gear Black", type: "웨어러블", price: 180)]
//    let data: [Item] = []
    var body: some View {
        NavigationStack {
            List {
                if data.isEmpty {
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        
                        Text("No favorites yet")
                            .font(.title)
                            .bold()
                            .padding()
                        Text("Hit the like button on each product page to save favorite ones.")
                            .foregroundColor(.secondary)
                    }
                    .listRowBackground(Color.clear)
                    .frame(width: 300)
                    .padding()
                } else {
                    ForEach(data) { item in
                        Section {
                            ZStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.trailing)
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .bold()
                                        Text(item.model ?? "fail")
                                            .foregroundColor(.indigo)
                                        Text("Type \(item.type ?? "fail")")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding()
                                }
                                .frame(height: 80)
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
                                    EmptyView()
                                }
                                .opacity(0.0)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("찜하기"))
            .toolbar {// 타이틀과 같은 높이로 하는 방법?
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "bag")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
