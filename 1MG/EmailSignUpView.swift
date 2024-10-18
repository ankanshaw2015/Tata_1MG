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

                Spacer()
                VStack(alignment: .leading, spacing: 1) {

                   // Text("Sign in with email")
                    Text("Sign in using email")
                        .font(.title2)
                        .bold()

                    Text("If you’re a new user, please sign in with your email here:")
                        .font(.subheadline)
                    NavigationLink {

                    } label: {
                        Text("New user sign in")

                            .font(.headline)

                            .foregroundColor(.blue)

                            .underline()
                    }


                }

                .padding(.horizontal)
                Spacer().frame(height: 60)

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
                
                Text(a)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .padding(5)

                Spacer()
                
            }

        }
        .ignoresSafeArea()
    }
}





struct EmailSignUpView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView{
            EmailSignUpView()
        }
        .navigationBarBackButtonHidden(false)
        

    }

}
