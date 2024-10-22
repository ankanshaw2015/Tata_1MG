//
//  DetailItemView.swift
//  1MG
//
//  Created by Yashom on 17/10/24.
//

import SwiftUI

struct DetailItemView: View {
    @State private var showPopup = false
      // @State private var selectedItems: [String] = []
    let options = ["1", "2", "3"]
    @State var myCart = false
   // @State var add = "Add"
    @State var addedItems = 0
    @State var itemData:ItemCellData //= ItemsFile().itemCellData[0]
    @EnvironmentObject var viewModel:MainViewModel
    var color1 = Color.orange
    
    init( itemData : ItemCellData = ItemsFile().itemCellData[0]){
        self.itemData = itemData
    }
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                ScrollView{
                    VStack(alignment:.leading){
                        ScrollView(.horizontal){
                            
                            HStack(alignment:.top){
                                ForEach(itemData.itemImages,id:\.self) { image in
                                    Image(image)
                                        .resizable()
                                        .frame(width: 350,height: 200)
                                        .cornerRadius(15)
                                        .padding(5)
                                        .shadow(radius: 4)
                                }
                            }
                            
                            
                        }//scroll view
                        .padding(10)
                        
                        VStack(){
                            Text(itemData.itemName)
                                .foregroundColor(.black)
                                .font(.title2)
                                .bold()
                                .padding(8)
                            
                            Spacer()
                            Text("CompanyInfo")
                                .foregroundColor(.gray)
                                .padding(5)
                            
                        }
                        .frame(width: 380, height: 100,alignment: .topLeading)
                        .background(.orange.opacity(0.1))
                        .padding(.horizontal,10)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                Text("4 ⭐️ ")
                                    .font(.title)
                                    .frame(width: 100, height: 50)
                                    .padding(.horizontal,10)
                                    .shadow(radius: 4)
                                
                                Text("Bestseller \n in Zingavita Skin")
                                    .font(.callout)
                                    .frame(width: 170, height: 50,alignment: .bottom)
                                    .padding(.horizontal,10)
                                    .shadow(radius: 4)
                                    .multilineTextAlignment(.center)
                                
                                Text("1094 people \n bought recently")
                                    .font(.callout)
                                    .frame(width: 170, height: 50)
                                    .padding(.horizontal,10)
                                    .shadow(radius: 4)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(5)
                            
                            
                        }
                        
                        HStack{
                            Text(itemData.deleveryDate)
                                .padding(10)
                        }
                        .frame(width: 380, height: 50,alignment: .leading)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(10)
                        
                        VStack(alignment:.leading){
                            Text("MRP \u{20B9}699")
                                .font(.title)
                                .foregroundColor(.gray)
                                .strikethrough()
                                .padding(.horizontal)
                            VStack{
                                HStack{
                                    Text("\u{20B9} \(itemData.itemPrice)")
                                        .font(.title)
                                        .bold()
                                        .padding(10)
                                    
                                    Text("\(  String(format:"%.1f",((699 - (Double(itemData.itemPrice) ?? 10))/699 * 100 )) ) % off with coupons")
                                        .font(.title3)
                                        .foregroundColor(.green)
                                        .bold()
                                    //.padding(10)
                                    
                                }
                                
                            }
                            .frame(width: 360, height: 80,alignment: .leading)
                            //.border(<#_#>, width: 2)
                            .background(RoundedRectangle(cornerRadius: 15).stroke())
                            .cornerRadius(12)
                            .padding(5)
                            
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Spacer()
//                            if addedItems == 0{
//
//                                RoundeButton(title: "Add"){
//                                    addedItems += 1
//                                }
//                                .frame(width: 190, height: 40)
//                                .padding(10)
//                                .padding(.horizontal)
//                            }
//                            else {
//                                addedItemButton(title: "\(addedItems) added"){
//                                    showPopup = true
//                                }
//                                .frame(width: 190, height: 40)
//                                .padding(10)
//                                .padding(.horizontal)
//
//
//
//                            }
                            
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
                                viewModel.addQuantity(for: itemData, quantity: addedItems)
                            }, label: {
                                if addedItems != 0{
                                    Text("Added \(addedItems)")
                                            .foregroundColor(.white)
                                            .fontWeight(.heavy)
                                            .padding()
                                            
                                            .shadow(radius: 10)
                                    .frame(width: 169,height: 40)
                                    .background(Color.orange)
                                    .cornerRadius(10)
                                }
                                else{
                                    Text("Add")
                                        .bold()
                                        .foregroundColor(color1)
                                        
                                        .frame(width: 169,height: 40)
                                        //.background(.blue)
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                }
                            })
                            .background(.white)
                            .frame(width: 170,alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 0, y: 5)
                            .padding(.horizontal,20)
                        }
                        ExtraDetails()
                            .padding()
                        
                        VStack{
                            HStack{
                                Text("")
                                    .frame(width: 10)
                                Text(itemData.itemInformation)
                                    .multilineTextAlignment(.leading)
                                    
                            }
                          
                                
                        }
                        .frame(width: 380)
                        .padding(.leading,10)
                        //.padding(.horizontal,10)
                       // .background(.blue)
                        
                        
                        
                        Sunsine()
                            .padding()
                        
                        Spacer()
                        
                        
                    }//vstack
                    
                    
                }//scrollview
               
               
                
                .navigationBarItems(trailing: CartButton())
                
               
                
                if showPopup {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                    
                    PopupView(addedItems: $addedItems, isPresented: $showPopup, item: $itemData, options: options)
                        .frame(width: 300, height: 350)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 20)
                }
                    
                
            }//Zstack
            .navigationTitle("")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "arrowshape.turn.up.right.fill")
            }))
            .navigationBarHidden(false)
        }//navigationView
        .onAppear {
            addedItems = viewModel.checkData(for: itemData)
        }
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
      //  NavigationView{
        
            DetailItemView()
            .environmentObject(MainViewModel())
       
    }
}
