//
//  ExtraDetails.swift
//  1MG
//
//  Created by Yashom on 17/10/24.
//

import SwiftUI

struct ExtraDetails: View {
    var body: some View {
        ZStack{
            Color.purple.opacity(0.3)
            VStack(alignment:.leading){
                Text("Payment, Returns & Expiry")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.purple)
                   
                VStack{
                    HStack(){
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .padding(8)
                            .frame(width: 50, height: 50)
                            .background(.white.opacity(0.7))
                            .cornerRadius(15)
                        VStack{
                            Text("Cash on delivery available                   ")
                                .bold()
                                
                            Text("Get your product first ,then pay us once you are sure")
                                .foregroundColor(.gray)
                                .bold()
                        }
                       
                    }
                 
                    HStack(){
                        Image(systemName: "arrow.2.circlepath.circle.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .padding(5)
                            .frame(width: 50, height: 50)
                            .background(.white.opacity(0.7))
                            .cornerRadius(15)
                        VStack{
                            Text("7 Day free return                                ")
                                .bold()
                                
                            Text("easily retun the product               ")
                                .foregroundColor(.gray)
                                .bold()
                        }
                       
                    }.padding(5)
                    
                    HStack(){
                        Image(systemName: "calendar.badge.plus")
                            .resizable()
                            .foregroundColor(.blue)
                            .padding(5)
                            .frame(width: 50, height: 50)
                            .background(.white.opacity(0.7))
                            .cornerRadius(15)
                        VStack{
                            Text("Product expire after March,2027                               ")
                                .bold()
                                
                            Text("We only stock quality items        ")
                                .foregroundColor(.gray)
                                .bold()
                        }
                       
                    }.padding(5)
                    
                    
                }
                .padding()
            }
            .frame(width: 360,height: 280,alignment: .leading)
            
           
        }
        .frame(width: 380, height: 300,alignment: .top)
       
    }
}

struct ExtraDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExtraDetails()
    }
}
