//
//  ItemDetailView.swift
//  ECommerce
//
//  Created by 이현재 on 2023/09/26.
//

import SwiftUI

struct ItemDetailView: View {
    @State private var isWish: Bool = false
    var item: Item
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Spacer()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .fontWeight(.bold)
                        .padding()
                    
                    if let model = item.model {
                        Text(model)
                            .padding()
                    }
                    
                    Text("event")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("description")
                        .padding()
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("총 금액")
                        Spacer()
                        Text(item.price.description)
                    }
                    .padding()
                    
                    Button {
                        isWish = true
                    } label: {
                        Text(isWish ? "장바구니에 담기" : "담겼습니다")
                            .foregroundColor(.white)
                            .frame(width: 330, height: 50)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            
            Spacer()
        }
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(id: "1", image: "applewatch", name: "애플워치", price: 450))
    }
}

