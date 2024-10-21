//
//  CartModel.swift
//  1MG
//
//  Created by Yashom on 18/10/24.
//

import Foundation

class MyCartData : ObservableObject {
    static let shared = MyCartData()
  
    @Published var cartItems: [(item: ItemCellData, quantity: Int)] = [(item:ItemsFile().itemCellData[0] , quantity:1),
                                                                       (item:ItemsFile().itemCellData[1] , quantity: 1)]
    
    private init(){}
}
