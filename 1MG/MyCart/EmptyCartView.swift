//
//  EmptyCartView.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct EmptyCartView: View {
    var body: some View {
        ZStack{
            Color.white
                
            
            VStack{
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(Circle().stroke()
                        .frame(width: 140, height: 140))
                    .padding()
                    .padding(.top,40)
                
                Text("Your Cart is empty")
                    .font(.title)
                    .bold()
                    .padding(.top)
                Text("We have all the medicines and health care products that you need")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
                
                Button {
                    
                } label: {
                    Text("Find Medicines")
                        .bold()
                        .foregroundColor(.orange)
                }
                .frame(width: 290, height: 40)
                .background(RoundedRectangle(cornerRadius: 15).stroke())
                
                Spacer()
            }
        }
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCartView()
    }
}
