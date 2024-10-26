//
//  PaymentPopUp.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct PaymentPopUp: View {
    
    //@EnvironmentObject var mainViewModel:MainViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @EnvironmentObject var viewModel : MainViewModel
    var body: some View {
        
        VStack(spacing:0){
            HStack{
                Circle()
                    .frame(width: 40,height: 40)
                    .foregroundColor(Color.orange)
                    .overlay(content: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                        
                            .scaledToFill()
                            .frame(width:18,height: 10)
                    })
                    .padding( .top,18)
                    .padding( .leading,18)
                
                VStack(alignment:.leading){
                    Text("Home")
                        .bold()
                    Text("Complete address ")
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button("Change") {
                    
                }
                .foregroundColor(.orange)
                .bold()
                .padding()
            }
           
            
            HStack{
                VStack(alignment: .leading){
                    Text("\u{20B9} \( String(format: "%.2f", (viewModel.totalBill())))")
                        .bold()
                    Text("see bill summary")
                        .foregroundColor(.orange)
                        .bold()
                }
                Spacer()
                
                NavigationLink(destination:
                            CheckoutView(totalAmount: viewModel.totalBill())
                ) {
                    Text("Continue")
                     .foregroundColor(.white)
                     .bold()
                     .frame(width: 140, height: 40)
                     .background(.orange)
                     .cornerRadius(10)
                }
                
               
            }
            .padding()
            //.padding(.bottom)
        }
        
        .background(.white)
        .frame(maxWidth: .infinity,minHeight: 170,alignment: .bottom)
        .background(LinearGradient(colors: [Color.pink,Color.purple], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
    }
}

struct PaymentPopUp_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPopUp()
            .environmentObject(MainViewModel())
    }
}
