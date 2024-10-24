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
    @EnvironmentObject var viewModel:MainViewModel
   
    var body: some View {
        
        HStack{
            Text(title)
                .font(.system(size: 22))
                .foregroundColor(.primary)
                .bold()
                .bold()
            
            Spacer()
            
            
            
            NavigationLink {
             SeeAllView()
                
            } label: {
                Text(titleAll)
                    .font(.system(size: 14))
                    .foregroundColor(.green)
                    .bold()
            }

            
        }
        .frame(height: 40)
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
            .padding(20)
            .environmentObject(MainViewModel())
    }
}
