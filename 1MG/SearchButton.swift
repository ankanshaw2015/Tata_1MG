//
//  SearchButton.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

struct SearchButton: View {
    //@State var placeHolder = "Placeholder"
    @Binding var text:String
    var data : [String] = ["sampoo", "oral care","healthy snacks","health packages","skin care"]
    @State var index = 0
    @State private var timer: Timer?
    var body: some View {
        HStack{
           
                //.frame(width: 14, height: 12)
            
            TextField("Search for \(data[index])", text: $text)
                .frame(minWidth: 0,maxWidth: .infinity, minHeight: 40)
                .padding(.horizontal)
            Image(systemName: "magnifyingglass") // Search icon
                           .foregroundColor(.gray)
                           .padding(.trailing,10)
        }
       
        .background(RoundedRectangle(cornerRadius: 20).stroke())
//        .border(.gray, width: 1)
//        .cornerRadius(20)
        .onAppear{startTimer()}
        
 //       .padding(10)
        
    }
    private func startTimer() {
           timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
           //    withAnimation(.linear) {
               withAnimation(.easeInOut) {
                   index = (index + 1) % data.count
               }
                
               //animate.toggle()
            //   }
           }
       }
}

struct SearchButton_Previews: PreviewProvider {
    @State static var text:String = "text"
    static var previews: some View {
        SearchButton(text: $text)
    }
}
