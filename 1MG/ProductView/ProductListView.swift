//
//  ProductListView.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductListView: View {
    var productList : [ItemCellData] = ItemsFile().itemCellData1
    
    var body: some View {
        ScrollView{
            ForEach(productList){items in
                ProductItems(item:items)
                    .padding(10)
                    
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
            .environmentObject(MainViewModel())
    }
}
