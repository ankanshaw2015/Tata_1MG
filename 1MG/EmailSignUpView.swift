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

    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.orange,Color.white], startPoint: .top, endPoint: .bottom)
            VStack {

                VStack(alignment: .leading, spacing: 1) {

                   // Text("Sign in with email")
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

                TextField("Enter your email id", text: $email)

                    .padding()

                    .background(Color(UIColor.systemGray6))

                    .cornerRadius(10)

                    .padding(.horizontal)

                Spacer().frame(height: 10)

                SecureField("Enter your password", text: $password)

                    .padding()

                    .background(Color(UIColor.systemGray6))

                    .cornerRadius(10)

                    .padding(.horizontal)

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
