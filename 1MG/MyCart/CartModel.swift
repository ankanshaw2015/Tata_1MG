//
//  CartModel.swift
//  1MG
//
//  Created by Yashom on 18/10/24.
//

import Foundation

class MyCartData{
    static let shared = MyCartData()
    var myCart:[ItemCellData] = [ItemsFile().itemCellData[0],ItemsFile().itemCellData[1]]
    private init(){}
}
