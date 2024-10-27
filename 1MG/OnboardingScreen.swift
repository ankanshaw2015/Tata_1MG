//
//  OnboardingScreen.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct OnboardingScreen: View {
    @State var showLogin = false
    @State private var selectPage = 0
    @State var pageArr = [
        [
            "title": "Your go-to health app",
            "subtitle": "Your complete heathcare companion in your pocket",
            "image": "onBoard_1"
        ],
                
        [
            "title": "Home delivery of medicines",
            "subtitle": "Order any medicine or health product",
            "image": "onBoard_2"
        ],
                
        [    "title": "Lab tests at home",
             "subtitle": "Book any test from any lab.",
             "image": "onBoard_3"
        ],
    ]
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .center){
            
            TabView(selection: $selectPage.animation()){
                ForEach(0 ..< pageArr.count, id: \.self){
                    index in
                    
                    let iObj = pageArr[index]
                    VStack{
                        Spacer()
                        
                        HStack{
                            Image(iObj["image"] ?? "")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                        
                        Text(iObj["title"] ?? "")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                        
                        Text(iObj["subtitle"] ?? "")
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onReceive(timer) { _ in
                            withAnimation {
                                // Increment the page index or loop back to 0
                                selectPage = (selectPage + 1) % pageArr.count
                            }
                        }
            // for capsule i.e dots when slide
            .overlay(HStack(spacing: 8){
                ForEach(0 ..< pageArr.count, id: \.self){
                    index in
                    
                    Capsule()
                        .fill(selectPage == index ? .black : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }.padding(.bottom), alignment: .bottom)
            
            VStack{
                
                Spacer()
                
                NavigationLink(){
                    EmailSignUpView()
                }
                   
            label: {
                Text("Lets Start")
                    .foregroundColor(.black)
                    .frame(minWidth: 0,maxWidth: .infinity, minHeight: 20,maxHeight: 60)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                .padding(.horizontal)
                
            }

            }
        }
    }
}


struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OnboardingScreen()
        }
        
    }
}
