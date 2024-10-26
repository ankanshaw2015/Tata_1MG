//
//  EmailSignUpView.swift
//  1MG
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct EmailSignUpView: View {
    @State var a = ""
    @State private var email: String = ""
    @State private var password:String = ""
    @EnvironmentObject var userViewModel: UserViewModel
    @State var logging : Bool = true
    @State var showPass = false

    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
            VStack {

                VStack(alignment: .leading, spacing: 1) {
                    Image("onBoard_2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 250, height: 250)


                }
                

                .padding(.horizontal)
               // Spacer()
                
                Text("Sign in to continue")
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

                Spacer().frame(height: 20)
                
                Button(action: {
                    print("succ")
                    userViewModel.logIn(username: email, password: password)
                    
                }, label: {
                    Text("Continue")

                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .background(
                        )
                })
                .padding(.horizontal)
                
                NavigationLink {
                    SignUpView()
                    
                } label: {
                    HStack {
                        Text("New User?")
                            .font(.system(size: 14))
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.orange)
                    }
                }
                  .padding(.top, 10)
                
                Text(userViewModel.text)
                    .foregroundColor(.red)
                    .bold()
                    .padding(.top)
               
 
                
            }
            
        }
        .ignoresSafeArea()
    }
}





struct EmailSignUpView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView{
            EmailSignUpView()
                .environmentObject(UserViewModel())
        }
        .navigationBarBackButtonHidden(false)
        

    }

}
