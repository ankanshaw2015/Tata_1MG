//
//  MyHome.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import Foundation
import SwiftUI

struct Home: View {

    @EnvironmentObject var viewModel:UserViewModel
    @State var isActive:Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Text("Welcome to the Home View!")
                    .font(.largeTitle)
                    .padding()
                Button("Log Out") {
                    viewModel.logOut()
                }
                .padding()
                
                NavigationLink(value: "Home") {
                    Text("this page")
                }
                .navigationDestination(for: String.self) { destination in
                    if destination == "Home" {
                        HomeView()
                    }
                }
            }
            .padding()
            // .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home()
        }
    }
}
