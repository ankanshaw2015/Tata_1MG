//
//  ProductParts.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct ProductParts: View {
    var image = "pill"
    var text = "Sampoos & \n Conditioners"
    let options = ["1", "2", "3"]
    
    var body: some View {
         
            VStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                Text(text)
                    .foregroundColor(.black)
                    .bold()
                
            
        }
        .frame(width: 110, height: 180)

    }
}

struct ProductParts_Previews: PreviewProvider {
    static var previews: some View {
        ProductParts()
    }
}
