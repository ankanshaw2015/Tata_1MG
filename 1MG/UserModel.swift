//
//  UserModel.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var username: String
    var password: String
}
