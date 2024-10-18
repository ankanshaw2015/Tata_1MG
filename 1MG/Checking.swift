//
//  Checking.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct Checking: View {
    var images = ["pill","doc","doc.fill","pill","doc","doc.fill"]
  @State  var selected = 0
    var body: some View {
        VStack{
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<6){index in
                        LabPackeges()
                            .onTapGesture {
                                withAnimation(.linear) {
                                    selected = index
                                }
                               
                            }
                    }
                }
            }
            
            TabView(selection:$selected){
                ForEach(0..<6){index in
                    NavigationLink(destination: {
                        
                    }) {
                        Image(systemName: images[index])
                            .tag(index)
                            .foregroundColor(.black)
                            .frame(width: 390, height: 100)
                            .background(.blue)
                    }
                    
                }
                }
            .tabViewStyle(PageTabViewStyle())
            
            .frame(height: 110)
         
            
        }
        }
       // .tabViewStyle()
    }


struct Checking_Previews: PreviewProvider {
    static var previews: some View {
        Checking()
    }
}
