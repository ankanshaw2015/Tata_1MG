//
//  UserModel.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import Foundation

class User: Codable {
    var username: String
    var password: String
    var cart: [CartItem]
    init(username: String, password: String) {
        self.username = username
        self.password = password
        self.cart = []
    }
}


struct CartItem: Codable {
    var item: ItemCellData
    var quantity: Int
}
