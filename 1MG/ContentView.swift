//
//  ContentView.swift
//  1MG
//
//  Created by Yashom on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
//            Image("unnamed")
//                .resizable()
//                .scaledToFill()
//                .frame(width:, height: )
            VStack {
                Spacer()
                
                Text("Welcome to our store")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .backgroundStyle(.black)
                    .multilineTextAlignment(.leading)
                    .padding(5)
                
                Text("get affordable madicines")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.light)
                    .backgroundStyle(.black)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 1, leading: 60, bottom: 5, trailing: 60))
                
                NavigationLink(){
                    EmailSignUpView()
                }
                   
            label: {
                RoundeButton(title: "Lets's Start"){
                    
                }
                
            }
                
                Spacer().frame(height: 30)
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
