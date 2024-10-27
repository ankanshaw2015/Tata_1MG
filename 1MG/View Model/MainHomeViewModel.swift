//
//  MainHomeViewModel.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import Foundation
import SwiftUI

class MainViewModel:ObservableObject{
    @Published var show:Bool = false
    @Published var seletectedTab :Int = 0
    
    @Published var deliveringTo:String = "Banglore"
    
    @Published var goToPlan = false
    @Published var goToDoc = false
    @Published var goToAdd = false
    
    @Published var serchText:String = ""
    @Published var cartData: [(item: ItemCellData, quantity: Int)] = []
    
   // [(item:ItemsFile().itemCellData[0] , quantity:1),(item:ItemsFile().itemCellData[1] , quantity: 1)]
    @Published var orderList:[(item: ItemCellData, quantity: Int)] = []
   // @Published var totalBill
    var cartview = MyCartView()
    var homeView = HomeView()
    
   // @Published var productIndex = 0
    var itemFile = ItemsFile()
    
    @Published var dataArray:[ItemCellData] = ItemsFile().itemCellData
    
    @Published var items: [ItemCellData] = []
       
       init() {
           loadItems() // Load all items initially, or you can pass a type to load specific ones
       }

    
    
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
    
    func getListOfItems(index : Int) {
        switch index {
        case 0 : dataArray = itemFile.itemCellData
        case 1 : dataArray = itemFile.itemCellData1
            print(dataArray[0].itemName)
        case 2 : dataArray = itemFile.itemCellData2
        case 3 : dataArray = itemFile.itemCellData
        case 4 : dataArray = itemFile.itemCellData1
        case 5 : dataArray = itemFile.itemCellData2
            
        default:
            dataArray = itemFile.itemCellData2
        }
    }
    
 
       func loadItems(ofType type: String? = nil) -> [ItemCellData]{
           guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
               print("JSON file not found")
               return items
           }

           do {
               let data = try Data(contentsOf: url)
               let decodedData = try JSONDecoder().decode(ItemList.self, from: data)

               if let type = type {
                   // Filter items by type if a type is specified
                   self.items = decodedData.itemCellData.filter { $0.itemType == type }
               } else {
                   // Load all items if no type is specified
                   self.items = decodedData.itemCellData
               }
           } catch {
               print("Error decoding JSON: \(error)")
           }
           
           return items
       }
   }

  
    

