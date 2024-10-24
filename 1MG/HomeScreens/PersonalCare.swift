//
//  PersonalCare.swift
//  1MG
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct PersonalCare: View {
    let images = ["pill","azit1","move1","viks1","azit2","lab2","mama","sunscreen"]
    let data = ["Hair Care","Oral Care","Sexual Wellness","Skin Care","Feminine Care","Baby Care","ElderLy Care", "Men Grooming"]
    var body: some View {
        VStack{
            HStack(spacing: 0){
                ForEach(0..<4) { index in
                    NavigationLink {
                        ProductView()
                    } label: {
                        SpecificItem(data: data[index], image: images[index])
                    }
                    Spacer()
                }
            }
            .padding(5)
            
            HStack(spacing: 0){
                ForEach(4..<8) { index in
                    NavigationLink {
                        
                    } label: {
                        SpecificItem(data: data[index], image: images[index])
                    }
                    Spacer()
                }
            }
            .padding(5)
        }
        
    }
}

struct PersonalCare_Previews: PreviewProvider {
    static var previews: some View {
        PersonalCare()
    }
}
