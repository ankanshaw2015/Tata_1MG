//
//  SignUpView.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Email", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    userViewModel.signUp(username: username, password: password)
                }) {
                    Text("Sign Up")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
