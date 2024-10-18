//
//  ItemModel.swift
//  1MG
//
//  Created by Yashom on 17/10/24.
//

import Foundation

class ItemCellData :Identifiable{
    var id:String = UUID().uuidString
    var itemName:String
    var itemImages:[String]
    var itemPrice:String
    var deleveryDate:String = "Delivery by 11pm today"
    var itemInformation:String = """
    
Product InforMation:
This is a medication primarily used for pain relief and to reduce fever. It contains paracetamol (acetaminophen) as its active ingredient, typically in a dosage of 650 mg.
    
Uses:
Pain Relief: Effective for mild to moderate pain, such as headaches, toothaches, muscle aches, and joint pain.
Fever Reduction: Helps lower fever in various conditions.
Dosage:
The usual adult dosage is one or two tablets every 4 to 6 hours, but it's important to follow the specific guidelines provided by a healthcare professional or the package instructions.
Precautions:
Liver Health: Since paracetamol is metabolized in the liver, individuals with liver disease or those who consume alcohol regularly should use it cautiously.
Overdose Risks: Taking more than the recommended dose can lead to severe liver damage, so it's crucial to adhere to dosing guidelines.
Side Effects:
While generally considered safe when used as directed, some potential side effects may include:

Allergic reactions (rare)
Nausea or vomiting (if taken in large doses)
"""
    init(itemName: String, itemImages: [String], itemPrice: String, deleveryDate: String) {
        self.itemName = itemName
        self.itemImages = itemImages
        self.itemPrice = itemPrice
        self.deleveryDate = deleveryDate
    }
    
}



class ItemsFile{
    var itemCellData:[ItemCellData] = [
    
        ItemCellData(itemName: "Azithromycin", itemImages: ["azit1","azit2","azit3"], itemPrice: "150.30", deleveryDate: "Delivery by 11pm today"),
    
        ItemCellData(itemName: "Vicks", itemImages: ["viks1","viks2","viks3"], itemPrice: "122.70", deleveryDate: "Delivery by 11pm today"),
    
        ItemCellData(itemName: "MamaEarth", itemImages: ["mama"], itemPrice: "250.30", deleveryDate: "Delivery by 11pm today"),
        
        ItemCellData(itemName: "Move", itemImages: ["move1"], itemPrice: "180.30", deleveryDate: "Delivery by 11pm today"),
        
        ItemCellData(itemName: "Pill", itemImages: ["pill"], itemPrice: "150.30", deleveryDate: "Delivery by 11pm today"),
        
        ItemCellData(itemName: "Sunscreen", itemImages: ["sunscreen"], itemPrice: "260.30", deleveryDate: "Delivery by 11pm today"),
    ]
    
    
    
}
