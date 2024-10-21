//
//  SearchButton.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

struct SearchButton: View {
    @State var placeHolder = "Placeholder"
    @Binding var text:String
    var body: some View {
        HStack{
           
                //.frame(width: 14, height: 12)
            
            TextField(placeHolder, text: $text)
                .frame(minWidth: 0,maxWidth: .infinity, minHeight: 40)
                .padding(.horizontal)
            Image(systemName: "magnifyingglass") // Search icon
                           .foregroundColor(.gray)
                           .padding(.trailing,10)
        }
       
        .background(Color(red: 1.0, green: 0.8, blue: 0.7).opacity(0.2))
        .border(.gray, width: 1)
        .cornerRadius(15)
        
        .padding(10)
        
    }
}

struct SearchButton_Previews: PreviewProvider {
    @State static var text:String = "text"
    static var previews: some View {
        SearchButton(placeHolder: "place", text: $text)
    }
}
