//
//  _MGApp.swift
//  1MG
//
//  Created by Yashom on 07/10/24.
//

import SwiftUI

@main
struct _MGApp: App {
    @StateObject var viewModel:UserViewModel = UserViewModel()
    var body: some Scene {
      
        WindowGroup {
                   NavigationView {
                       LetsStartView()
                   }
                   .environmentObject(viewModel)
               }
    }
}
