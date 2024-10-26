//
//  SpecificItem.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct SpecificItem: View {
//    var data = " wellness"
    var image = "pill"
    
    var body: some View {
        VStack(spacing: 0){
            VStack(){
                Image(image)
                    .resizable()
                    .padding(3)
            }
        }
        .frame(width: 95, height: 140)
       // .background(.blue)
        .cornerRadius(25)
    }
}

struct SpecificItem_Previews: PreviewProvider {
    static var previews: some View {
        SpecificItem()
    }
}
