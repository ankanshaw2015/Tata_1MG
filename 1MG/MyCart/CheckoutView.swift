//
//  CheckoutView.swift
//  1MG
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct CheckoutView: View {
    @State var totalAmount: Double = 150.00
    @EnvironmentObject var mainViewModel:MainViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @State private var isAnimating = false
    
    @State private var isLoading = false
    @State private var isDone = false
    

    var body: some View {
      
            ZStack{
                
                VStack {
                    Text("Checkout")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "cart.fill")
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                            Text("Total Amount")
                                .font(.title2)
                            
                            Spacer()
                            Text("\u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill())))")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        HStack{
                            
                            
                            Text("You have saved \u{20B9} \( String(format: "%.2f", (mainViewModel.totalBill() * 1.8) - mainViewModel.totalBill())) on this order")
                                .foregroundColor(Color.green)
                                .bold()
                                .padding()
                                .padding(.horizontal)
                        }
                        .background(.green.opacity(0.2))
                        .frame(alignment: .center)
                        
                        HStack {
                            Text("Bill Details")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        
                        VStack(alignment: .leading) {
                            VStack{
                                
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
                            }
                            .frame(width: 300, height: 250,alignment: .leading)
                            
                            
                            
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Button(action: {
                        withAnimation {
                            isAnimating.toggle()
                            checkout()
                        }
                        //                    DispatchQueue.main.async {
                        //
                        //
                        //                           userViewModel.addItemsToCart(mainViewModel.cartData)
                        //                        mainViewModel.cartData.removeAll()
                        //                    }
                        
                        
                    }) {
                        Text("Buy Now")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isAnimating ? Color.green : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .scaleEffect(isAnimating ? 1.1 : 1.0) // Animation effect
                    }
                    .padding(.horizontal)
                    .animation(.easeInOut(duration: 0.2), value: isAnimating)
                    
                    Spacer()
                }
                .frame(width: 340)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
                .padding()
                
                if isLoading {
                   // ProgressView()
                     PaymentSuccessfulView()
                }
//                if isDone{
//                    PaymentSuccessfulView()
//                }
            
        }
    }
    
    private func checkout() {
      //  withAnimation(.easeInOut) {
            isLoading = true
       // }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Reduced delay for testing
            // Perform the cart addition before setting loading to false
            userViewModel.addItemsToCart(mainViewModel.cartData)
            mainViewModel.cartData.removeAll()

            withAnimation {
                isLoading = false
                isDone = true
            }
        }
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(MainViewModel())
            .environmentObject(UserViewModel())
        
    }
}
