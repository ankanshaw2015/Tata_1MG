//
//  PrescriptionView.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct PrescriptionView: View {
    @EnvironmentObject var viewModel:MainViewModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 1.0, green: 0.8, blue: 0.7))
                .frame(height: 200)
                .overlay {
                    VStack(alignment:.leading,spacing: 0){
                        HStack{
                            Text("What do you wish to order with your prescription?")
                                .bold()
                            Spacer()
                            Button {
                                viewModel.show = false
                                
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 25)
                                
                            }
                            
                        }
                        
                        HStack{
                            NavigationLink {
                                
                            } label: {
                                VStack(alignment:.leading){
                                    Image("lab2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 70, height: 50)
                                        .padding(.horizontal,20)
                                    
                                    HStack{
                                        Text("Order \n medicines ")
                                            .foregroundColor(.black)
                                            .bold()
                                        Spacer()
                                        Image(systemName: "chevron.right.circle.fill")
                                            .resizable()
                                            .frame(width: 30,height: 39)
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(5)
                                .frame(width: 170,height: 140)
                                .background()
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                Spacer()
                                
                                NavigationLink {
                                    
                                } label: {
                                    VStack(alignment:.leading){
                                        Image("lab1")
                                            .resizable()
                                            .frame(width: 70, height: 50)
                                            .padding(.horizontal,20)
                                        
                                        HStack{
                                            Text("Book \n Lab Tests")
                                                .foregroundColor(.black)
                                                .bold()
                                            Spacer()
                                            Image(systemName: "chevron.right.circle.fill")
                                                .resizable()
                                                .frame(width: 30,height: 39)
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(5)
                                    .frame(width: 170,height: 140)
                                    .background()
                                    .cornerRadius(15)
                                    .shadow(radius: 2)
                                }
                                
                                
                            }
                            .padding(5)
                            
                        }
                    }
                    .frame(width: 370,height: 200)
                }
        }
        
    }
}

struct PrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PrescriptionView()
    }
}
