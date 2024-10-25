//
//  Specialdeals.swift
//  1MG
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct Specialdeals: View {
    var images : [String] = ["a1","a2","a3","a4","a5","a6","a7",]
    var destination = [Text("ankan"),Text("aryan"),Text("Arpit sir"),Text("ankan"),Text("aryan"),Text("Arpit sir"),Text("aa")]
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                
                ForEach(0..<images.count,id:\.self) { index in
                    
                    NavigationLink (destination: destination[index]
                                    , label: {
                        
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .foregroundColor(.black)
                            .frame(width: 300, height: 200)
                            .cornerRadius(15)
                            .clipped()
                    })
                    
                    
                }
                
                
            }
            .offset(x: -CGFloat(currentIndex ) * 300) // Offset to show the current image
            .animation(.easeInOut(duration: 0.5), value: currentIndex)
        }
        .frame(height: 145)
        //.background(.blue)
        
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
           timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
               withAnimation {
                  
                   currentIndex = (currentIndex + 1) % images.count
               }
           }
       }
}

struct Specialdeals_Previews: PreviewProvider {
    static var previews: some View {
        Specialdeals()
    }
}
