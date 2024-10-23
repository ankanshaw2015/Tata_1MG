//
//  NavigationPart.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct NavigationPart: View {
    @EnvironmentObject var viewModel:MainViewModel
    var body: some View {
        HStack(alignment: .center,spacing: 0){
            Circle()
                .frame(width: 60,height: 60)
                .foregroundColor(Color.orange)
                .overlay(content: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .foregroundColor(Color.white)
                    
                        .scaledToFill()
                        .frame(width:30,height: 30)
                })
                .padding( .top,18)
                .padding( .leading,18)
            
            Text(viewModel.deliveringTo)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .font(.callout)
                .padding(.top, 10)
                .padding(.leading,8)
            
            Image(systemName: "chevron.down")
                .padding(.top,10)
                .padding(.leading,0)
            
        }.padding(.top,18)
    }
}

struct NavigationPart_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPart()
            .environmentObject(MainViewModel())
    }
}
