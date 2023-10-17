//  Item.swift
//  ECommerce
//
//  Created by 이현재 on 10/5/23.
//

import Foundation
import SwiftUI

enum ItemCategory: String, CaseIterable, Codable {
    case wearable = "웨어러블"
    case laptop = "노트북"
    case phone = "핸드폰"
    case tablet = "태블릿"
    case other = "none"
}

struct Item: Identifiable, Codable, Equatable {
    var id: Int
    var image: String
    var name: String
    var model: String? = nil
    var type: String?
    var price: Int
    var amount: Int?
    var wish: Bool = false
    var category: ItemCategory?
}

class ItemManager: ObservableObject {
    static let shared = ItemManager()
    
    @Published var itemList: [Item] = [
        Item(id: 1, image:"applewatch", name: "애플워치", model: "Series 6: Red", price: 450, wish: true),
        Item(id: 2, image:"applepencil", name: "애플펜슬", price: 100, wish: false),
        Item(id: 3, image:"appletv.fill", name: "애플tv", price: 100, wish: false),
        Item(id: 4, image:"homepodmini.fill", name: "애플홈팟", price: 100, wish: false),
        Item(id: 5, image:"iphone.gen1", name: "아이폰", price: 100, wish: false),
        Item(id: 6, image:"applewatch.watchface", name: "애플워치2", price: 150, amount: 0, wish: false),
        Item(id: 7, image:"applewatch.watchface", name: "갤럭시워치", model: "Gear Black", type: "웨어러블", price: 180, wish: true)
    ]
    
    @Published var basketList: [Item] = [
        Item(id: 1, image:"applewatch", name: "애플워치", price: 450, amount: 0, wish: true),
        Item(id: 2, image:"applepencil", name: "애플펜슬", price: 100, wish: false),
        Item(id: 6, image:"applewatch.watchface", name: "애플워치2", price: 150, amount: 0, wish: false)
    ]
    
    @Published var wishList: [Item] = [
        Item(id: 1, image:"applewatch", name: "애플워치", model: "Series 6: Red", price: 450, wish: true),
        Item(id: 7, image:"applewatch.watchface", name: "갤럭시워치", model: "Gear Black", type: "웨어러블", price: 180, wish: true)
    ]
    
    func getList() -> [Item] {
        return itemList
    }
    
    func getBasketList() -> [Item] {
        return basketList
    }
    
    func getWishList() -> [Item] {
        return wishList
    }
    
    func addBasket(_ item: Item) {// 해당 id가 있으면 추가하지 못하게
        basketList.append(item)
    }
    
    func addWish(_ item: Item) {
        if !wishList.contains(item) {
            wishList.append(item)
        }
    }
    
    // 위시리스트에서 아이템 제거
    func removeWish(_ item: Item) {
        if let index = wishList.firstIndex(of: item) {
            wishList.remove(at: index)
        }
    }
    
    func updateItem(_ item: Item) {
        if let index = itemList.firstIndex(where: { $0.id == item.id }) {
            itemList[index] = item
        }
        if let index = wishList.firstIndex(where: { $0.id == item.id }) {
            wishList[index] = item
        }
    }
    
    func toggleWish(_ selectedItem: Item) {
        if getList().firstIndex(where: { $0.id == selectedItem.id }) != nil {
            var updatedItem = selectedItem
            updatedItem.wish.toggle()
            updateItem(updatedItem)
            if updatedItem.wish {
                addWish(updatedItem)
            } else {
                removeWish(updatedItem)
            }
        }
    }
}
