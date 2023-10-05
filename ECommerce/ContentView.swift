//
//  ContentView.swift
//  ECommerce
//
//  Created by CNU on 2023/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            BasketView()
                .tabItem {
                    Image(systemName: "cart")
                }
        }
        .accentColor(.indigo)
        // 탭 아이콘 뒤에 아우라 effect 처리
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
