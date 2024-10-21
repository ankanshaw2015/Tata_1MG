//
//  Cartbutton.swift
//  1MG
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

import SwiftUI

struct CartButton: View {
    @EnvironmentObject var viewModel: MainViewModel
   // @State var items = 1

    var body: some View {
        NavigationLink(destination: MyCartView()) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart.fill")
                    //.resizable()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(25)
                
                // Overlay text positioned at the top right
                if viewModel.cartData.count > 0 {
                    Text("\(viewModel.cartData.count)")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 25, height: 25)
                        .background(Color.orange)
                        .clipShape(Circle())
                    //  .padding(8) // Adjust the padding as needed
                }
            }
        }
    }
}


struct Cartbutton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
            .environmentObject(MainViewModel())
    }
}
