//
//  RoundeButton.swift
//  1MG
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct RoundeButton: View {
    var title:String = "title"
    var didTap:(()->())?
    var color:UIColor = .green
    var body: some View {
        Button(action: {
            didTap?()
        }){
        Text(title)
                .foregroundColor(.white)
                .fontWeight(.heavy)
        }
        .frame(minWidth: 0,maxWidth: .infinity, minHeight: 20,maxHeight: 60)
        .background(Color.orange)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct RoundeButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundeButton()
            .padding(20)
    }
}
