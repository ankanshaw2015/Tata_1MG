//
//  SignInUPViewModel.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var view:EmailSignUpView = EmailSignUpView()
    @Published var users: [User] = []
    @Published var isLoggedIn: Bool = false

    func signUp(username: String, password: String) {
        let newUser = User(username: username, password: password)
        users.append(newUser)
        isLoggedIn = true
    }

    func logIn(username: String, password: String) {
//        if let _ = users.first(where: { $0.username == username && $0.password == password }) {
//            isLoggedIn = true
//        }
        print("process")
        if username.isEmpty || password.isEmpty{
            view.a = "Email or Password cannot be empty"
        }
        else if username == password{
            isLoggedIn = true
            print("done")
        }
        else{
            view.a = "Email or password is not valid"
        }
    }

    func logOut() {
        isLoggedIn = false
    }
}



