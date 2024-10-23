//
//  ProductItems.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductItems: View {
    
    @State var item :ItemCellData = ItemsFile().itemCellData[0]
     
     let deliver = "delevery by 11 pm"
     let options = ["1", "2", "3"]
     
     @State var addedItems = 0
     @State var switchButton = false
     @State var showPopup = false
     
     @EnvironmentObject var viewModel:MainViewModel
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image(item.itemImages[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 100)
                        .padding()
                    
                    VStack(alignment:.leading){
                        Text(item.itemName)
                            .bold()
                            .padding(.top)
                        Text("500 ml")
                            .foregroundColor(.gray)
                        HStack{
                            
                            Text("4.5 ⭐️")
                                .bold()
                                .padding(3)
                                .background(.green)
                                .cornerRadius(10)
                            
                            Text("946 ratings")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Text("Get by 6pm")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack{
                            Text("\u{20B9} \(item.itemPrice)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.leading,5)
                            
                            Text("30% off")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.leading,5)
                            
                        }
                        
                        Button(action: {
                            //  didAddCart?()
                            print("button tapped")
                            if addedItems == 0 {
                                addedItems += 1
                            }
                            //  addedItems += 1
                            
                            else if addedItems >= 1 {
                                withAnimation(.easeInOut) {
                                    showPopup = true
                                }
                                print(addedItems)
                            }
                            print(addedItems)
                            viewModel.addQuantity(for: item, quantity: addedItems)
                        }, label: {
                            if addedItems != 0{
                                Text("Added \(addedItems)")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .padding()
                                
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .frame(width: 169,height: 40)
                                    .background(Color.orange)
                            }
                            else{
                                Text("Add")
                                    .foregroundColor(.orange)
                                    .bold()
                                    .frame(width: 169,height: 40)
                            }
                        })
                        .background(.white)
                        .frame(width: 170,alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 5)
                        .padding(5)
                        
                        
                    }
                }
            }
            .frame(width: 260, height: 210,alignment: .topLeading)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 4, x: 0, y: 3)
            
            if showPopup {
                Color.black.opacity(0.4) // Background overlay
                    .edgesIgnoringSafeArea(.all)
                
                PopupView(addedItems: $addedItems, isPresented: $showPopup, item: $item, options: options)
                    .frame(width: 300, height: 350)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 20)
            }
            
        }
    }
}

struct ProductItems_Previews: PreviewProvider {
    static var previews: some View {
        ProductItems()
            .environmentObject(MainViewModel())
    }
}
