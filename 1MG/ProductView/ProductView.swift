//
//  ProductView.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var viewModel:MainViewModel
    //@State var index = 0
    @State var data:ItemCellData = ItemsFile().itemCellData[0]
    //@State var dataArray:[ItemCellData] = ItemsFile().itemCellData
    
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                HStack{
                    VStack{
                        ScrollView{
                            ForEach(0..<5){i in
                                ProductParts()
                                    .onTapGesture {
                                      viewModel.getListOfItems(index: i)
                                        print("tapped",i)
                                    }
                            }
                        }
                    }
                    .frame(width: 110, height: 699)
                    .background(.gray.opacity(0.3))
                    
                    VStack{
                        ScrollView{
                            ForEach(0..<6, id: \.self){index in
                                ProductItems(item:viewModel.dataArray[index])
                                    .padding(10)
                                    
                            }
                        }
                        
                    }
                    .frame(width: 280, height: 699, alignment: .top)
                    
                }//hstack
            }//Vstack
            .frame(maxWidth: .infinity, maxHeight: 699,alignment: .topLeading)
            .background()
            //.navigationTitle("care")
        }
        
//        private func startTimer() {
//               timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
//               //    withAnimation(.linear) {
//
//                       index = (index + 1) % images.count
//                   animate.toggle()
//                //   }
//               }
//           }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(MainViewModel())
    }
}
