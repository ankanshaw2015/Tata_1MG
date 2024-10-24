//
//  MyCartView.swift
//  1MG
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct MyCartView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
   //  var cartData = MyCartData.shared.myCart
  //  @State var counts : [Int] = [1,1]
    var items = ItemsFile().itemCellData
    @State var sum  = 0
    
    var body: some View {
        NavigationView{
            
            
            ZStack{
                
                VStack{
                    ScrollView{
                        
                        VStack(alignment: .leading){
                            
                            // .navigationTitle("My Cart")
                            
                            HStack{
                                Image(systemName: "cart.fill")
                                    .resizable()
                                    .foregroundColor(.green)
                                    .padding(5)
                                    .frame(width: 50, height: 50)
                                    .background(.white.opacity(0.7))
                                    .cornerRadius(15)
                                VStack{
                                    Text("delevery by")
                                    Text("18 - 21 October")
                                        .bold()
                                        .foregroundColor(.green)
                                }
                            }
                            .padding()
                            
                            
                            ForEach(mainViewModel.cartData, id: \.0) { item, quantity in
                                //                    let item = cartData[index]
                                VStack {
                                    HStack {
                                        Image(item.itemImages[0])
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .padding(.leading, 10)
                                        
                                        VStack(alignment: .leading) {
                                            Text(item.itemName)
                                                .font(.title3)
                                                .bold()
                                            Text("\u{20B9} \(item.itemPrice)")
                                        }
                                        .frame(width:160,alignment: .leading)
                                        Spacer()
                                        // Text("x")
                                        Stepper("X \(quantity)") {
                                            if quantity <= 10{
                                                mainViewModel.addQuantity(for: item)
                                            }
                                            
                                            
                                        } onDecrement: {
                                            if quantity >= 1{
                                                mainViewModel.minimizeQuantity(for: item)
                                                
                                                //  print(mainViewModel.cartData[0])
                                            }
                                            
                                        }
                                        .padding(.horizontal,5)
                                        
                                    }
                                    .frame(width: 380, height: 60, alignment: .leading)
                                    .background(Color.orange.opacity(0.2))
                                    .padding(3)
                                }
                            }
                            
                            ExtraDetails()
                            
                            ScrollView(.horizontal){
                                Image("demo")
                            }
                            
                            SectionTitleAll(title: "Top Medicines",titleAll: "")
                                .bold()
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(0..<5){index in
                                        HStack{
                                            ItemCell(item:items[index])
                                        }
                                    }
                                }
                            }
                            
                            VStack{
                                Text("Bill Summary")
                                    .bold()
                                    .padding()
                                HStack{
                                    Text("Item Total (MRP) ")
                                    Spacer()
                                    
                                    Text("\u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill() * 1.8)))")
                                }
                                .padding(5)
                                
                                HStack{
                                    Text("Packing Charge ")
                                    Spacer()
                                    
                                    Text("\u{20B9} 0")
                                }
                                .padding(5)
                                
                                HStack{
                                    Text("Total Discount ")
                                    Spacer()
                                    
                                    Text("- \u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill() * 1.8) - mainViewModel.totalBill()))" )
                                        .foregroundColor(Color.green)
                                        .bold()
                                }
                                .padding(5)
                                
                                HStack{
                                    Text("To be paid ")
                                        .bold()
                                    Spacer()
                                    
                                    Text("\u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill())))")
                                        .bold()
                                }
                                .padding(.top,15)
                                .background(.white.opacity(0.4))
                                .frame(alignment: .center)
                                
                                HStack{
                                    
                                    
                                    Text("You have saved \u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill() * 1.8) - mainViewModel.totalBill())) on this order")
                                        .foregroundColor(Color.green)
                                        .bold()
                                        .padding()
                                        .padding(.horizontal)
                                }
                                .background(.green.opacity(0.2))
                                .padding(.top,15)
                                
                                .frame(alignment: .center)
                                
                                Spacer()
                            }
                            .frame(width: 380, height: 300,alignment: .leading)
                            .background(.orange.opacity(0.2))
                            
                            Sunsine()
                            
                            Spacer()
                        }//vstack\
                        .frame(width: 380,alignment: .leading)
                        //.background(.blue)
                        
                    }//scrollview
                    
                    PaymentPopUp()
                    
                }//Vstack
                
                if mainViewModel.cartData.isEmpty{
                    withAnimation(.linear(duration: 1)) {
                        EmptyCartView()
                    }
                    }
                   
                
            }//zstack

        }
        //.navigationBarHidden(true)
        //navigationview
    }

}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
       // NavigationView{
            MyCartView()
        //}
        .environmentObject(MainViewModel())
    }
}
