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
    @Published var users: [User] = [User(username: "Ankan", password: "1234")]
    @Published var isLoggedIn: Bool = false
    @Published var text = ""
    @Published var loggedInUser: User = User(username: "Ankan", password: "1234")

    
    func fetchCartItems() -> [(item: ItemCellData, quantity: Int)] {
        return loggedInUser.cart.map { ($0.item, $0.quantity) }
    }

 
    func addItemsToCart(_ items: [(item: ItemCellData, quantity: Int)]) {
         let user = loggedInUser

        for newItem in items {
            if let index = user.cart.firstIndex(where: { $0.item.id == newItem.item.id }) {
                user.cart[index].quantity += newItem.quantity
            } else {
                user.cart.append(CartItem(item: newItem.item, quantity: newItem.quantity))
            }
        }

     
        loggedInUser = user
    }

    // Signup function
    func signUp(username: String, password: String) {
        // Check if user already exists
        if users.contains(where: { $0.username == username }) {
            text = "User already exists"
            return
        }

        let newUser = User(username: username, password: password)
        users.append(newUser)
        loggedInUser = newUser
        isLoggedIn = true
    }

    // Login function
    func logIn(username: String, password: String) {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            loggedInUser = user
            isLoggedIn = true
            
        } else {
            text = "Invalid username or password"
        }
    }

    // Logout function
    func logOut() {
//        loggedInUser = nil
        isLoggedIn = false
    }
}

