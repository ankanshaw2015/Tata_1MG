//
//  SignInUPViewModel.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//







import Foundation
import Combine

class UserViewModel: ObservableObject {
//    @Published var users: [User] = []
//    @Published var isLoggedIn: Bool = false
//    @Published var loggedInUser: User?
//    @Published var loginError: String? = nil
//    @Published var text = ""

    @Published var view:EmailSignUpView = EmailSignUpView()
    @Published var users: [User] = []
    @Published var isLoggedIn: Bool = false
    @Published var text = ""
    @Published var loggedInUser: User = User(username: "Ankan", password: "1234")

    // Fetch the cart items as an array of tuples
    func fetchCartItems() -> [(item: ItemCellData, quantity: Int)] {
        return loggedInUser.cart.map { ($0.item, $0.quantity) }
    }

    // Add multiple items to the cart
    func addItemsToCart(_ items: [(item: ItemCellData, quantity: Int)]) {
         var user = loggedInUser

        for newItem in items {
            if let index = user.cart.firstIndex(where: { $0.item.id == newItem.item.id }) {
                user.cart[index].quantity += newItem.quantity
            } else {
                user.cart.append(CartItem(item: newItem.item, quantity: newItem.quantity))
            }
        }

        // No need to save to UserDefaults; just update the logged-in user
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

//import Foundation
//import Combine
//
//class UserViewModel: ObservableObject {
//    @Published var view:EmailSignUpView = EmailSignUpView()
//    @Published var users: [User] = []
//    @Published var isLoggedIn: Bool = true//false
//    @Published var text = ""
//    @Published var logginUser : User = User(username: "Ankan", password: "1234")
//
//    func signUp(username: String, password: String) {
//        let newUser = User(username: username, password: password)
//        users.append(newUser)
//        isLoggedIn = false// true
//        logginUser = newUser
//        print(newUser.username)
//    }
//
//    func logIn(username: String, password: String) {
//        if let user = users.first(where: { $0.username == username && $0.password == password }) {
//            isLoggedIn = true
//            logginUser = user
//        }
//        else{
//            text = "You are not registered yet"
//        }
//
//    }
//
//    func logOut() {
//        isLoggedIn = false
//    }
//
//
//}


//
//import Foundation
//import Combine
//
//class UserViewModel: ObservableObject {
//    @Published var users: [User] = []
//     @Published var isLoggedIn: Bool = false
//     @Published var logginUser: User? = nil
//     @Published var loginError: String? = nil
//    @Published var text = ""
//     private let usersKey = "usersKey"
//
//     init() {
//        // loadUsers()
//     }
//
//     // Fetch the cart items as an array of tuples
//     func fetchCartItems() -> [(item: ItemCellData, quantity: Int)] {
//         return logginUser?.cart.map { ($0.item, $0.quantity) } ?? []
//     }
//
//    func addItemsToCart(_ items: [(item: ItemCellData, quantity: Int)], pass :String) {
//         guard var user = logginUser else { return }
//
//         for newItem in items {
//             if let index = user.cart.firstIndex(where: { $0.item.id == newItem.item.id }) {
//                 user.cart[index].quantity += newItem.quantity
//             } else {
//                 user.cart.append(CartItem(item: newItem.item, quantity: newItem.quantity))
//             }
//         }
//
//         saveUser(user,pass: pass)
//         logginUser = user
//     }
//
//     // Signup function
//     func signUp(username: String, password: String) {
//         // Check if user already exists
//         if users.contains(where: { $0.username == username }) {
//             loginError = "User already exists"
//             return
//         }
//
//         let newUser = User(username: username, password: password)
//         users.append(newUser)
//         saveUser(newUser,pass: password)
//         logginUser = newUser
//         isLoggedIn = true
//     }
//
//     // Login function
//     func logIn(username: String, password: String) {
//         if let user = users.first(where: { $0.username == username && $0.password == password }) {
//             logginUser = user
//             isLoggedIn = true
//             loginError = nil
//         } else {
//             text = "Invalid username or password"
//         }
//     }
//
//     // Load users from UserDefaults
//     private func loadUsers() {
//         if let data = UserDefaults.standard.data(forKey: usersKey) {
//             if let users = try? JSONDecoder().decode([User].self, from: data) {
//                 self.users = users
//             }
//         }
//     }
//
//     // Save the updated user data
//    private func saveUser(_ user: User, pass:String) {
//         if let index = users.firstIndex(where: { $0.username == user.username }) {
//             users[index] = user
//         } else {
//             users.append(user)
//         }
//
//         if let encoded = try? JSONEncoder().encode(users) {
//             UserDefaults.standard.set(encoded, forKey: pass)
//         }
//     }
//
//     // Logout function
//     func logOut() {
//         logginUser = nil
//         isLoggedIn = false
//     }
//}
