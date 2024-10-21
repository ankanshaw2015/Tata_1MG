//
//  start.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import SwiftUI

struct LetsStartView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
    
    @StateObject var view:MainViewModel = MainViewModel()
    var body: some View {
        //       if viewModel.isLoggedIn{
        //            HomeView()
        //                .environmentObject(view)
        //        }
        //        else{
        //            ContentView()
        //        }
        
        //   }
        MyCartView()
            .environmentObject(viewModel)
    }
}
struct LetsStartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           Home()
        }
    }
}
