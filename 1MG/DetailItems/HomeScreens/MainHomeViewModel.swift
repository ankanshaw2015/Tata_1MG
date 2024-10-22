//
//  MainHomeViewModel.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import Foundation

class MainViewModel:ObservableObject{
    @Published var show:Bool = false
    @Published var seletectedTab :Int = 0
    
    @Published var serchText:String = ""
    @Published var cartData: [(item: ItemCellData, quantity: Int)] = [(item:ItemsFile().itemCellData[0] , quantity:1),
                                                                      (item:ItemsFile().itemCellData[1] , quantity: 1)]
    var cartview = MyCartView()
    
    func fetchCartItems() -> [(item: ItemCellData, quantity: Int)]{
        
        return cartData
    }
    
    
    
    func addQuantity(for item: ItemCellData, quantity: Int = 12) {
            if let index = cartData.firstIndex(where: { $0.item.itemName == item.itemName }) {
                
                if quantity == 12{
                    cartData[index].quantity += 1
                }
                else if quantity == 0{
                    cartData.remove(at: index)
                }
                else{
                    cartData[index].quantity = quantity
                }
             //   print(cartData[index])
            }
        else{
            cartData.append((item:item,quantity:quantity))
        }
        
    }
    
    func minimizeQuantity(for item: ItemCellData, quantity: Int = 1) {
        if let index = cartData.firstIndex(where: { $0.item.itemName == item.itemName }) {
                cartData[index].quantity -= quantity
            if cartData[index].quantity == 0 || quantity == 0{
                cartData.remove(at: index)
            }
            //    print(cartData[index])
            
            
        }
    }
    
    func checkData(for item:ItemCellData) -> Int {
        if let index = cartData.firstIndex(where: { $0.item.itemName == item.itemName }) {
            
            return cartData[index].quantity
        }
    else{
        return 0
    }
        
    }
    
    func totalBill() -> Double{
    
            let sum = (0..<cartData.count).reduce(0) { (result, index) in
                result + (Double(cartData[index].item.itemPrice )! * Double(cartData[index].quantity))
                
               // cartData[index].
                       }
    
            return sum
        }
    
    func goToCart() -> MyCartView{
        return cartview
    }
}
