//
//  SectionTitleAll.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = " Title"
    @State var titleAll: String = "View All"
    var didTap : (()->())?
    
    var body: some View {
        
        HStack{
            Text(title)
                .font(.system(size: 26))
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(titleAll)
                .font(.system(size: 14))
                .foregroundColor(.green)
            
        }
        .frame(height: 40)
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
            .padding(20)
    }
}
