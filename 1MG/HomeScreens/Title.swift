//
//  Title.swift
//  1MG
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct Title: View {
    @State var title = "No title"
    @State var titleAll = ""
    
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 22))
                .foregroundColor(.primary)
                .bold()
                .bold()
            
            Spacer()
            
            
            
            
            Text(titleAll)
                .font(.system(size: 14))
                .foregroundColor(.green)
                .bold()
            
        }
        .frame(height: 40)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
