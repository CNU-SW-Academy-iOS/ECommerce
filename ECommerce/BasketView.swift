//
//  BasketView.swift
//  ECommerce
//
//  Created by CNU on 2023/09/24.
//

import SwiftUI

struct BasketView: View {
    @State private var totalPrice: Int = 0
    
    @State var data: [Item] = [Item(id: "1", image:"applewatch", name: "애플워치", price: 450, amount: 0),
                               Item(id: "2", image:"applewatch", name: "애플워치", price: 450, amount: 0),
                               Item(id: "3", image:"applewatch.watchface", name: "애플워치2", price: 150, amount: 0)]
    
    var body: some View {
        NavigationStack {
            List {
                if data.isEmpty {
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
                } else {
                    ForEach(data) { item in
                        Section {
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
                                        Stepper(value: Binding(
                                            get: { data[data.firstIndex(where: {$0.id == item.id})!].amount ?? 0 },
                                            set: { newValue in
                                                let oldValue = data[data.firstIndex(where: {$0.id == item.id})!].amount ?? 0
                                                data[data.firstIndex(where: {$0.id == item.id})!].amount = newValue
                                                totalPrice += (newValue - oldValue) * item.price }), in: 0...10) {
                                                    Text("\(item.amount ?? 0)")
                                                }
                                    }
                                }
                                .padding()
                            }
                            .frame(height: 80)
                        }  
                    }
                }         
            }
            .onAppear {
                // 로컬 데이터 수량 불러오기
            }
            .navigationTitle(Text("장바구니"))
            .toolbar {
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
                    Text("￦\(totalPrice)")
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

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
