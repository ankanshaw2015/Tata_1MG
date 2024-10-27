//
//  ListOfItems.swift
//  1MG
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct ListOfItems: View {
    
    var items :[ItemCellData] = ItemsFile().itemCellData
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(0..<6) { index in
                    // var item = mainViewModel.cartData[index]
                    NavigationLink {
                        withAnimation {
                            DetailItemView(itemData:items[index])
                        }


                    } label: {
                        ItemCell(item:items[index])
                    }

                }
            }
        }
    }
}

struct ListOfItems_Previews: PreviewProvider {
    static var previews: some View {
        ListOfItems(items: ItemsFile().itemCellData)
    }
}
