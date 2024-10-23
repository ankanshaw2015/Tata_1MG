//
//  Prescription.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct Prescription: View {
    @EnvironmentObject var mainViewModel:MainViewModel
    
    var body: some View {
       
        Button {
            mainViewModel.show = true
            print("ss",mainViewModel.show )
        } label: {
            HStack{
                Image("prescription")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .cornerRadius(10)
                    .padding(.leading,10)
                Text("Order With Prescription ")
                    .foregroundColor(.black)
                Spacer()
                Text("Order Now")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .padding(8)
                    .padding(.horizontal)
                    .background(.black)
                    .cornerRadius(18)
                    .padding(4)
            }
            //HEnds2
            .padding(.vertical,8)
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal,10)
        }

       
        
    }
   
}

struct Prescription_Previews: PreviewProvider {
    static var previews: some View {
        Prescription()
    }
}
