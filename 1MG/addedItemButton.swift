//
//  addedItemButton.swift
//  1MG
//
//  Created by Yashom on 17/10/24.
//

import SwiftUI

struct addedItemButton: View {
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
                .padding()
        }
        .frame(minWidth: 0,maxWidth: .infinity, minHeight: 20,maxHeight: 60,alignment: .leading)
        .background(Color.orange)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct addedItemButton_Previews: PreviewProvider {
    static var previews: some View {
        addedItemButton()
    }
}
