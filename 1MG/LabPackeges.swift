//
//  LabPackeges.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct LabPackeges: View {
    var data = "For Women"
    var image = "pill"
    @State var color = false
    var body: some View {
        VStack(spacing: 0){
          
                Image(image)
                    .resizable()
                    
                   // .padding(3)
            
            .frame(width: 100,height: 100)
            .cornerRadius(55)
            .padding(5)
            .background()
            Spacer()
            Text(data)
                .bold()
            VStack{
                
            }
            .frame(width: 100, height: 8)
           
            .background(color ? Color.blue : Color.white)
            .padding(.top,5)
            
              
        }
        .frame(width: 140, height: 145)
        .background()
        .cornerRadius(15)
    }
}

struct LabPackeges_Previews: PreviewProvider {
    static var previews: some View {
        LabPackeges()
    }
}
