//
//  MyCartView.swift
//  1MG
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct MyCartView: View {
    @State var cartData = MyCartData.shared.myCart
    @State var counts : [Int] = [1,1]
    var items = ItemsFile().itemCellData
    
    var body: some View {
        NavigationView{
            ScrollView{
            VStack(alignment: .leading){
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
                
                ForEach(cartData.indices, id: \.self) { index in
                    let item = cartData[index]
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
                            Stepper("X \(counts[index])") {
                                if counts[index] <= 10{
                                    counts[index] += 1
                                }
                                
                                
                            } onDecrement: {
                                if counts[index] >= 1{
                                    counts[index] -= 1
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
                                ItemCell(image: items[index].itemImages[0], name: items[index].itemName, price: items[index].itemPrice)
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
                        
                       let sum = Double(cartData[0].itemPrice) ?? 10
                        
                        ForEach(1..<counts.count) { indx in
                            
                        }
                       
                        
                        Text("\(  String(format:"%.1f",(699 - (Double(cartData[0].itemPrice) ?? 10))) )")
                        
                        Text("\(Double(cartData[0].itemPrice) ?? 10)")
                    }
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
            .navigationTitle("Cart Details")
        }//navigationview
    }
    func totalBill() -> Int{
        // var sum = 0
        
//        ForEach(1..<counts.count){index in
//            sum += Double(cartData[0].itemPrice) ?? 10
//        }
        
        let sum = (0..<counts.count).reduce(0) { (result, index) in
            result + (Int(cartData[index].itemPrice) ?? 5 * (counts[index]))
                   }
        
        return sum
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
