//
//  MainTabView.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

struct MainTabView: View {
  //  @StateObject var homeVm = HomeViewModel.shared
    @EnvironmentObject var homeVm : MainViewModel
    var body: some View {
        
        ZStack{
           
            VStack{
                TabView(selection: $homeVm.seletectedTab){
                    HomeView().tag(0)
                    ExploreView().tag(1)
                    ExploreView().tag(2)
                    ExploreView().tag(3)
                    ProfileView().tag(4)
                }
                .onAppear{
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: homeVm.seletectedTab, perform: {
                    newVal in debugPrint(newVal)
                })
                
                HStack{
                    Button(action: {
                        print("0")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVm.seletectedTab = 0
                            }
                        }
                    }, label: {
                        VStack{
                            Image(systemName: homeVm.seletectedTab == 0 ? "house.fill" : "house")
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(.black)
                        }.padding(5)
                        
                        
                    })
                    .foregroundColor(homeVm.seletectedTab == 0 ? .blue : .black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: {print("0")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVm.seletectedTab = 1
                            }
                        }}, label: {
                            VStack{
                                Image(systemName: homeVm.seletectedTab == 1 ? "doc.fill" : "doc")
                                Text("Plans")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }.padding(5)
                            
                        }).foregroundColor(homeVm.seletectedTab == 1 ?  .blue : .black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: {
                        print("0")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVm.seletectedTab = 2
                            }
                        }
                    }, label: {
                        Circle()
                            .foregroundColor(.orange.opacity(1))
                            
                            .padding(1)
                            .overlay(content: {
                                VStack{
                                    Text("Get")
                                    Text("Core Plans")
                                        .font(.system(size: 8))
                                        //.background(.white)
                                        
                                }
                            })
                            .background(Circle())
                        
                    }).foregroundColor(homeVm.seletectedTab == 2 ?  .blue : .black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: {
                        print("0")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVm.seletectedTab = 3
                            }
                        }
                    }, label: {
                        VStack{
                            Image(systemName: homeVm.seletectedTab == 3 ? "book.fill" : "book")
                            Text("Labs")
                                .font(.caption)
                        }
                        
                        
                    }).foregroundColor(homeVm.seletectedTab == 3 ? .blue : .black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: {
                        print("0")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVm.seletectedTab = 4
                            }
                        }
                    }, label: {
                        VStack{
                            Image(systemName: homeVm.seletectedTab == 4 ? "person.fill":"person")
                            Text("profile")
                                .font(.caption)
                                
                        }
                        .padding(5)
                        
                    }).foregroundColor(homeVm.seletectedTab == 4 ?  .blue : .black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                
                .frame( minHeight: 0, maxHeight: 50)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: -2)
                .padding(.bottom,20)
            }
            .ignoresSafeArea()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainTabView()
                .environmentObject(MainViewModel())
        }
       
    }
}
