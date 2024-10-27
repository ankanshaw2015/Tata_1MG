//
//  SignUpView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct SignUpView: View {
   // @State private var name = ""
    @State private var email:String = ""
    @State private var password:String = ""
    @EnvironmentObject var userViewModel:UserViewModel
    @State private var alert = ""
    @Environment(\.presentationMode) var presentationMode
    @State var showPass = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                
                // Conditionally show the image based on keyboard visibility
               
                    Image("onBoard_1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                
                
                Text("Sign up to continue")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.bottom, 10)
                
                VStack(spacing: 15) {
 
                    TextField("Enter email", text: $email)
                        .textInputAutocapitalization(.never)
                        .padding(5)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 20).stroke())
                    
                    HStack{
                        if showPass {
                            TextField("Enter password", text: $password)
                                .textInputAutocapitalization(.never)
                                .padding(5)
                                .frame(height: 40)
                        }
                        else{
                            SecureField("Enter password", text: $password)
                                .textInputAutocapitalization(.never)
                                .padding(5)
                                .frame(height: 40)
                        }
                        
                        
                            
                        Spacer()
                        
                      
                            Image(systemName: showPass ? "eye.fill" : "eye.slash")
                                .padding(.trailing)
                                .onTapGesture {
                                    showPass.toggle()
                                }
                     
                    }
                    .background(RoundedRectangle(cornerRadius: 20).stroke())
                    
                }
                .padding(.horizontal, 20)
                
                Button{
                    if email.isEmpty || password.isEmpty {
                        alert = "email or password cannot be empty"
                    }
                    else if !email.contains("@gmail.com"){
                        alert = "Not a valid mail"
                    }
                    else if password.count < 8{
                        alert = "password should have atleast 8 letter"
                    }
                        else{
                            userViewModel.signUp(username: email, password: password)
                    }
                    
                    
                } label: {
                    Text("Sign Up")
                        .bold()
                        .bold()
                        .foregroundColor(.white)
                    
                }
                .frame(width: 200, height: 50)
                .background(.orange)
                .cornerRadius(20)
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Log In")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.orange)
                    }
                }
                .padding(.top, 10)
                
                Text(alert)
                    .bold()
                    .foregroundColor(.red)
                
                Spacer()
            }
        }
       // .keyboardResponsive(isKeyboardVisible: $isKeyboardVisible) // Apply the keyboard responsive modifier
     
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
