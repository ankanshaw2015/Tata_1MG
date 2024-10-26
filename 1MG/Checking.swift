//
//  Checking.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import SwiftUI

struct Checking: View {
    var images = ["women","men","lifestyle","healthCare","organ","specialTest"]
    var data = ["For Women", "For Men", "Lifestyle \n CheckUps","Health Concerns","By Organs","Special Tests"]
    var dataImage = ["p1","p2","p3","p4","p5","p6"]
    
  @State  var selected = 0
    var body: some View {
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<6){index in
                        LabPackeges(data: data[index], image: dataImage[index])
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
                        AddvertiseView()
                    }) {
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            //.foregroundColor(.black)
                            .frame(width: 390, height: 250)
                            //.background(.blue)
                    }
                    
                }
                }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            .frame(height: 180)
         
            
        }
        }
       // .tabViewStyle()
    }


struct Checking_Previews: PreviewProvider {
    static var previews: some View {
        Checking()
    }
}
