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
    @State private var activeButtonIndex: Int? = nil
    let images = ["p11","p21","p31","p41","p51","p61"]
   @State var count :Int = 5


    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                HStack{
                    VStack{
                        ScrollView(showsIndicators:false){
                            ForEach(0..<images.count, id: \.self){index in
                                
                                Button(action: {
                                    
                                    if activeButtonIndex == index {
                                      
                                        activeButtonIndex = nil
                                    } else {
                                       
                                        activeButtonIndex = index
                                    }
                                    withAnimation() {
                                        self.index = index
                                            
                                    }
                                }) {
                                    Image(images[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 99, height: 130,alignment: .topLeading)
                                      
                                        .frame(width: 100, height: 120)
                                        .background(activeButtonIndex == index ? Color.blue : Color.white)
                                        .cornerRadius(15)
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
