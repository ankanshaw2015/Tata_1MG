//
//  ProfileView.swift
//  1MG
//
//  Created by Yashom on 14/10/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var mainViewModel:MainViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    @State var name: String = "there!"
    @State var subName :String = "Sign in to start your healthcare journey"
    var icons = ProfileData().iconImage
    var mainList = ProfileData().profileList
    @State var about = ProfileData().section
    
    
    var body: some View {
        
        NavigationView {
        ZStack( alignment:.topLeading){
            Color(.gray)
                .opacity(0.3)
                .ignoresSafeArea()
           
            ScrollView{
                
                if userViewModel.isLoggedIn {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("hi \(userViewModel.logginUser.username)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Be well always")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        
                            RoundeButton(title: "Log Out") {
                                userViewModel.isLoggedIn = false
                            }
                            .frame(width: 370, height: 50)
                            .padding(.vertical,15)
                        }
                        
                        
                       
                    }
                    
                    
                 else{
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("hi \(name)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(subName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: {
                            SignInView()
                        }, label: {
                            RoundeButton(title: "Sign in") {
                                
                            }
                            .frame(width: 370, height: 50)
                            .padding(.vertical,15)
                        })
                        
                        
                       
                    }
                    
                }
                //  VStack(alignment: .leading, spacing: 0){
                    List {
                        ForEach((0..<mainList.count),id: \.self) { data in
                            NavigationLink {
                                OrderedListView()
                                
                            } label: {
                                HStack{
                                    Image(systemName: icons[data])
                                    Text(mainList[data])
                                    //Text("\(data), \(mainList[data])")
                                }
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 370)
                    .cornerRadius(15)
                    .clipped()
                    //  }
                    
                    
                    Spacer().frame(height: 10)
                    
                    List {
                        ForEach(about,id: \.self) { data in
                            NavigationLink {
                                OrderedListView()
                            } label: {
                                HStack{
                                    // Image(systemName: icons)
                                    Text(data)
                                    //Text("\(data), \(mainList[data])")
                                }
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .clipped()
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 130)
                    .cornerRadius(15)
                    Spacer()
                    
                    Text("Making HealthCare")
                    Text("UnderStandable, Accessible & Affordable")
                        .bold()
                        .foregroundColor(.gray)
                    
                }
                .padding(15)
                // .shadow(color: .gray.opacity(0.3), radius: 2,x: 0,y: 2)
                
//                .onDisappear{
//                    mainViewModel.seletectedTab = 0
//                }
                
            }
                
            }
            
            
        }
       
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserViewModel())
    }
}
