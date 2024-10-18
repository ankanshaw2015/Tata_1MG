//
//  SignInView.swift
//  1MG
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct SignInView: View {
    @State var mob:String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
            VStack{
                Spacer()
                Image("sign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 170, alignment: .center)
                Spacer().frame(height: 100)
                
                VStack{
                    Text("Sign in to continue")
                        .frame(width: 400, height: 20, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading, 40)
                    
                    HStack{
                        Button(action: {}) {
                            Text("+91")
                        }
                        .padding(.leading,20 )
                        .padding(.trailing, 5)
                        .padding(.bottom,1)
                        
                        TextField("Enter Mobile Number", text: $mob)
                            .frame(width: 300,height: 30)
                            .background(Color.white)
                            .padding(.trailing,20)
                            .padding(.bottom,0)
                            .cornerRadius(15)
                    }
                    Text("enter valid mobile number")
                        .frame(width: 400, height: 10, alignment: .leading)
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .padding(.leading,140)
                   Button(action: {}, label: {
                       Text("Get varification code")
                           .foregroundColor(.white)
                           .fontWeight(.bold)
                   })
                   .frame(width: 330, height: 40, alignment: .center)
                   .background(.orange)
                   .cornerRadius(10)
                   .padding(EdgeInsets(top: 14, leading: 10, bottom: 10, trailing: 10))
                  
                }
                NavigationLink(destination: EmailSignUpView(), label: {
                    Text("sign in with Email")
                }
            )
                
                
                    
                Spacer().frame(height: 100)
                
                Text("By signing in you agree to our \n Terms & Conditions")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom,40)
                
                
            }
           
        }
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignInView()
        }
        
    }
}
