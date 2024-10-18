//
//  ItemCell.swift
//  GroceryAppClone
//
//  Created by Yashom on 10/10/24.
//

import SwiftUI

struct ItemCell: View {
    var didAddCart: (()->())?
    var image = "pill"
    var name = "paracetamot"
    var price = "190.00"
    var deliver = "delevery by 11 pm"
    var color1 = Color.orange
    var color2 = Color.white
   @State var addedItems = 0
    @State var switchButton = false
    @State var showPopup = false
    let options = ["1", "2", "3"]
    var body: some View {
        
        ZStack{
            VStack(spacing: 0){
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140,height: 140,alignment: .top)
                    .clipped()
                    .cornerRadius(15)
                    .padding(.top,3)
                
                // Spacer()
                VStack(alignment:.leading){
                    Text(name)
                        .fontWeight(.bold)
                    //.frame(alignment: .leading)
                        .padding(.leading,10)
                    
                    
                    
                    Text("20 tablets")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .frame(alignment: .leading)
                        .padding(.leading,5)
                    
                    Text("Paracetamol")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .frame(alignment: .leading)
                    
                        .padding(.leading,5)
                    
                    HStack{
                        // Text("\(String(format: "\u{20B9}%.2f", 180.00))")
                        Text("\u{20B9} \(price)")
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
                        didAddCart?()
                        addedItems += 1
                        if addedItems > 0 {
                            withAnimation(.easeIn(duration: 2)) {
                                switchButton = true
                            }
                           
                        }
                        
                    }, label: {
                        if addedItems != 0{
                            addedItemButton(title: "\(addedItems) added"){
                                showPopup = true
                            }
                            .frame(width: 169,height: 40)
                        }
                        else{
                            Text("Add")
                                .foregroundColor(color1)
                                .bold()
                                .frame(width: 169,height: 40)
                        }
                    })
                    .background(color2)
                    .frame(width: 170,alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3, x: 0, y: 5)
                    .padding(5)
                    
                }
                // .frame(width: .infinity,alignment: .leading)
                .shadow(radius: 2)
                //.padding(5)
            }
            //VStack
            .frame(width: 180, height: 290)
            
            .overlay(
                RoundedRectangle(cornerRadius: 15 )
                    .stroke()
                    .foregroundColor(.gray.opacity(0.8))
            )
            //.padding(10)
            
            if showPopup {
                Color.black.opacity(0.4) // Background overlay
                    .edgesIgnoringSafeArea(.all)
                
                PopupView(addedItems: $addedItems, isPresented: $showPopup, options: options)
                    .frame(width: 300, height: 350)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 20)
            }
            
        }//ZStack
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell()
    }
}