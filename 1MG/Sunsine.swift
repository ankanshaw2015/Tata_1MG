//
//  Sunsine.swift
//  1MG
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct Sunsine: View {
    var body: some View {
        VStack{
            Text("Adding some Sunsine to your life")
                .bold()
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [Color.orange, Color.purple], startPoint: .leading, endPoint: .trailing))
            
            Image("1mg")
                .resizable()
                .scaledToFill()
                .frame(width:150,height: 80,alignment: .leading)
                .clipped()
                .cornerRadius(30)
            
        }
        .frame(width: 380, height: 480)
        .background(.pink.opacity(0.1))
    }
}

struct Sunsine_Previews: PreviewProvider {
    static var previews: some View {
        Sunsine()
    }
}
