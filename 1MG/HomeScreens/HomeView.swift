//
//  HomeView.swift
//  1MG
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVm:HomeViewModel = HomeViewModel.shared
    @EnvironmentObject var mainViewModel:MainViewModel
    @State var showPrescription:Bool = false
    var images : [String] = ["pill","doc","doc.fill"]
    var destination = [Text("ankan"),Text("aryan"),Text("Arpit sir")]
    @State private var currentIndex = 0
    @State private var timer: Timer?
    @State var a = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading){
                LinearGradient(colors: [Color.orange.opacity(0.1),Color.white], startPoint: .top, endPoint: .bottom)
                
                ScrollView{
                    VStack(alignment:.leading){
                        NavigationPart()
                        
                        VStack{
                            
                            SearchButton( placeHolder:a, text: $homeVm.serchText)
                            
                           
                            
                            HStack{
                                Image("pill")
                                    .resizable()
                                    .frame(width: 180, height: 100)
                                    .scaledToFit()
                                    .cornerRadius(15)
                                
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color.blue.opacity(0.8))
                                    .frame(width: 180, height: 100)
                                    .cornerRadius(15)
                                
                            }//hEnds1
                            .padding(.horizontal,10)
                            
                            Prescription()
                                
                            
                                
                            
                            
                            SectionTitleAll(title: "Special Deals", titleAll: "see more")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    
                                    ForEach(0..<images.count,id:\.self) { index in
                                        
                                        NavigationLink (destination: destination[index]
                                                        , label: {
                                            
                                            Image(systemName: images[index])
                                                .resizable()
                                                .scaledToFill()
                                                .foregroundColor(.black)
                                                .frame(width: 300, height: 200)
                                                .cornerRadius(15)
                                                .clipped()
                                        })
                                        
                                        
                                    }
                                    
                                    
                                }
                                .offset(x: -CGFloat(currentIndex ) * 300) // Offset to show the current image
                                .animation(.easeInOut(duration: 0.5), value: currentIndex)
                            }
                            .frame(height: 200)
                            
                            .onAppear {
                                startTimer()
                            }
                            .onDisappear {
                                timer?.invalidate()
                            }
                            //1st Scroll ends
                            
                            SectionTitleAll(title: "Hair & skin suppliments", titleAll: "see all")
                                .padding(5)
                            
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(0..<10) { index in
                                        NavigationLink {
                                            
                                        } label: {
                                            ItemCell()
                                        }
                                        
                                    }
                                }
                            }
                            //second scroll ends
                            
                            SectionTitleAll(title: "Personal care", titleAll: "")
                                .padding(5)
                            
                            
                            HStack(spacing: 0){
                                ForEach(0..<4) { index in
                                    NavigationLink {
                                        
                                    } label: {
                                        SpecificItem()
                                    }
                                    Spacer()
                                }
                            }
                            .padding(5)
                            
                            HStack(spacing: 0){
                                ForEach(0..<4) { index in
                                    NavigationLink {
                                        
                                    } label: {
                                        SpecificItem()
                                    }
                                    Spacer()
                                }
                            }
                            .padding(5)
                            
                            
                        }
                        SectionTitleAll(title:"Lab testes and packages")
                        
                        
                        Checking()
                        
                        SectionTitleAll(title:"Lab testes and packages")
                        
                      
                    }
                  
                }//ScrollView
                if mainViewModel.show {
                  
                    PrescriptionView()
                        .padding(.top,650)
                        .transition(.move(edge: .bottom))
                     //   .animation(.easeInOut)
                }
                
                
            }.ignoresSafeArea() //ZStack
            
        }//Navigation
    }//Body
    
    

    
    private func startTimer() {
           timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
               withAnimation {
                  
                   currentIndex = (currentIndex + 1) % images.count
               }
           }
       }
    
//    private func startTimer() {
//           timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
//               withAnimation {
//                   // Increment the current index and wrap around
//                   currentIndex = (currentIndex + 1) % (images.count + 2)
//                   // If we reach the end (last duplicated image), reset to the first image
//                   if currentIndex == 0 {
//                       currentIndex = 1
//                   }
//               }
//           }
//       }
    
    func show(){

            if mainViewModel.show {
                    PrescriptionView()
                        .padding(.top,650)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                    
                }
            
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
