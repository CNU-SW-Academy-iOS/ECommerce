//
//  HomeView.swift
//  ECommerce
//
//  Created by 이현재 on 2023/09/26.
//

import SwiftUI

struct TabBarView: View {
    var tabbarItems: [ItemCategory]
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabbarItems.indices, id: \.self) { index in
                        Text(tabbarItems[index].rawValue)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(selectedIndex == index ? .white : .black)
                            .background(
                                Capsule()
                                    .foregroundColor(selectedIndex == index ? .blue : .clear)
                            )
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                    }
                }
            }
            .padding()
        }
    }
}

struct HomeView: View {
    @State var input: String = ""
    @State private var selectedTab: Int = 0
    @StateObject var manager = ItemManager.shared
    
    let tabBarItems : [String] = ["웨어러블", "노트북", "핸드폰", "태블릿"]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $input)
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.secondary)
                }
                .padding()
                
                
                Text("지금 바로\n주문하세요!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                let tabBarItems = ItemCategory.allCases
                TabBarView(tabbarItems: tabBarItems, selectedIndex: $selectedTab)
                
                TabView(selection: $selectedTab,
                        content:  {
                    CategoryView()
                        .tag(0)
                    Text("Tab Content 1")
                        .tag(1)
                    Text("Tab Content 2")
                        .tag(2)
                    Text("Tab Content 3")
                        .tag(3)
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
