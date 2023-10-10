//
//  Item.swift
//  ECommerce
//
//  Created by 이현재 on 10/5/23.
//

import Foundation

struct Item: Identifiable, Codable {
    var id: String
    var image: String
    var name: String
    var model: String? = nil
    var type: String?
    var price: Int
    var amount: Int?
}
