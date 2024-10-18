//
//  SpecificItem.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct SpecificItem: View {
    var data = "Hair Care"
    var body: some View {
        VStack(spacing: 0){
            VStack(){
                Image("pill")
                    .resizable()
                    .padding(3)
            }
            
            .frame(width: 80,height: 100)
            .padding(5)
            .background(.orange)
            Spacer()
            Text(data)
              
        }
        .frame(width: 85, height: 140)
       // .background(.blue)
        .cornerRadius(15)
    }
}

struct SpecificItem_Previews: PreviewProvider {
    static var previews: some View {
        SpecificItem()
    }
}
