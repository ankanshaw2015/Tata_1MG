//
//  ProductParts.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductParts: View {
    var image = "p11"
   
    @State var color = Color.white
    
    var body: some View {
         
            VStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 99, height: 130,alignment: .topLeading)
                  
                    .frame(width: 100, height: 120)
                    .background(color)
                    .cornerRadius(15)
            
        }
            
     

    }
}

struct ProductParts_Previews: PreviewProvider {
    static var previews: some View {
        ProductParts()
    }
}
