//
//  ProductView.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var viewModel:MainViewModel
    @State var index = 0
    @State var data:ItemCellData = ItemsFile().itemCellData[0]
    @State var dataArray:[ItemCellData] = ItemsFile().itemCellData1
    //var itemType:String
   @State var count :Int = 5
//    init(type:String = "normal"){
//        count = 1
//        
//        if type == "normal"{
//            dataArray = ItemsFile().itemCellData1
//        }
//        else{
//            dataArray = viewModel.loadItems(ofType: type)
//        }
//    }

    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                HStack{
                    VStack{
                        ScrollView{
                            ForEach(0..<count){i in
                                ProductParts()
                                    .padding(5)
                                    .onTapGesture {
//                                        dataArray = ItemsFile().itemCellData1
                                        withAnimation() {
                                            index = i
                                                
                                        }
                                       
                                    }
                            }
                        }
                    }
                    .frame(width: 110, height: 699)
                    .background(.gray.opacity(0.1))
                    
                    VStack{
                        if index == 0 {
                            ProductListView(productList: dataArray)
                        }
                        if index == 1{
                            ProductListView(productList: ItemsFile().itemCellData)
                        }
                        if index == 2 {
                            ProductListView(productList: ItemsFile().itemCellData1)
                        }
                        if index == 3{
                            ProductListView(productList: ItemsFile().itemCellData2)
                        }
                        if index == 4{
                            ProductListView(productList: ItemsFile().itemCellData)
                        }
                        if index == 5{
                            ProductListView(productList: ItemsFile().itemCellData2)
                        }
                        
                    }
                    .frame(width: 280, height: 699, alignment: .top)
                    
                    
                }//hstack
            }//Vstack
            .frame(maxWidth: .infinity, maxHeight: 699,alignment: .topLeading)
            .background()
            .onAppear{
                startTimer(3)
            }
            
            //.navigationTitle("care")
        }
    
    }
    private func startTimer(_ index:Int) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            //addedItems = viewModel.checkData(for: item)
            viewModel.getListOfItems(index: index)
             // print("tapped",i)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(MainViewModel())
    }
}
