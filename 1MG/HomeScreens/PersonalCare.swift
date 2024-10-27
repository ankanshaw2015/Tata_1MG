//
//  PersonalCare.swift
//  1MG
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct PersonalCare: View {
    let images = ["p11","p21","p31","p41","p51","p61","p71","p81"]
//    let data = ["Hair Care","Oral Care","Sexual Wellness","Skin Care","Feminine Care","Baby Care","ElderLy Care", "Men Grooming"]
    var body: some View {
        VStack{
            HStack(spacing: 0){
                ForEach(0..<4) { index in
                    NavigationLink {
                        ProductView()
                    } label: {
                        SpecificItem( image: images[index])
                    }
                   
                }
            }
           // .padding(5)
            
            HStack(spacing: 0){
                ForEach(4..<8) { index in
                    NavigationLink {
                        ProductView()
                    } label: {
                        SpecificItem( image: images[index])
                    }
                   
                }
            }
           // .padding(.horizontal)
        }
        
        
    }
}

struct PersonalCare_Previews: PreviewProvider {
    static var previews: some View {
        PersonalCare()
    }
}
