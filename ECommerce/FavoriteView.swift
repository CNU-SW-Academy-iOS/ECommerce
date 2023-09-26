//
//  FavoriteView.swift
//  ECommerce
//
//  Created by CNU on 2023/09/24.
//

import SwiftUI

struct Favorite: Hashable {
    let image: String
    let name: String
    let info: String
    let type: String
}

struct FavoriteView: View {
    let data: [Favorite] = [Favorite(image:"applewatch", name: "애플워치", info: "Series 6: Red", type: "웨어러블")]
//    let data: [Favorite] = []
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
                }
                ForEach(data, id: \.self) { item in
                    HStack {
                        Image(systemName: item.image)
                            .resizable()
                            .scaledToFit()
                            .padding(.trailing)
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .bold()
                            Text(item.info)
                                .foregroundColor(.indigo)
                            Text("Type \(item.type)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    }
                    .frame(height: 80)
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
