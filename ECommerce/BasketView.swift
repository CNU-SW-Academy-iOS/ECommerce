//
//  BasketView.swift
//  ECommerce
//
//  Created by CNU on 2023/09/24.
//

import SwiftUI

struct Item: Hashable {
    let image: String
    let name: String
    let price: Int
    var amount: Int
}

struct BasketView: View {
    @State var total_price: Int = 0
//    let data: [Item] = []
    @State private var dummyDatas: [Item] = [Item(image:"applewatch", name: "애플워치", price: 450, amount: 1),
                                             Item(image:"applewatch.watchface", name: "애플워치2", price: 150, amount: 2)
    ]

    var body: some View {
        NavigationStack {
            List {
                if dummyDatas.isEmpty {
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        
                        Text("No Items added")
                            .font(.title)
                            .bold()
                            .padding()
                        Text("Hit the plus button to save into basket.")
                            .foregroundColor(.secondary)
                    }
                    .listRowBackground(Color.clear)
                    .frame(width: 300)
                    .padding()
                }
                ForEach(dummyDatas, id: \.self) { item in
                    ItemView(item: item)
                }
            }
            .onAppear {
                // 로컬 데이터 수량 불러오기
            }
            .navigationTitle(Text("장바구니"))
            .toolbar {// 타이틀과 같은 높이로 하는 방법?
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "bag")
                            .foregroundColor(.orange)
                    }
                }
            }
            VStack {
                HStack {
                    Text("총 금액")
                    Spacer()
                    Text("￦\(total_price)k")
                }
                Button {
                    
                } label: {
                    Text("결제하기")
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .buttonStyle(.plain)
                        .background(.indigo)
                        .cornerRadius(12)
                }
                .padding()
            }
            .padding()
            .background(Color.clear)
        }
    }
}

struct ItemView: View {
    @State var item: Item
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(item.name)
                    .bold()
                Text("￦\(item.price)k")
                    .foregroundColor(.indigo)
                HStack {
                    Text("수량")
                        .foregroundColor(.secondary)
                    Stepper(value: $item.amount, in: 1...10) {
                        Text("\(item.amount)")
                    }
                    .onChange(of: item.amount) { newValue in
                        BasketView().total_price += newValue*item.price
                        // 반영이 안됨
                        item.amount = newValue
                        
                    }
                }
            }
            .padding()
        }
        .frame(height: 80)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
