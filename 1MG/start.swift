//
//  start.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import SwiftUI

struct LetsStartView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
    
   
    var body: some View {
        
            if viewModel.isLoggedIn{
               
                OnboardingScreen()
               // HomeView()
                    
            }
            else{
                HomeView()
               // OnboardingScreen()
               // ContentView()
                
            }
            
        
    }
 
           
    }
