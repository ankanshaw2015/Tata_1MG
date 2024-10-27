

//  HomeView.swift
//  1MG
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var mainViewModel:MainViewModel
    @State var showPrescription:Bool = false
    var items = ItemsFile().itemCellData
    @State var navigateToPlans = false

    // @State var navigateToLab = false
    @State var text :String = ""

    var body: some View {
        //NavigationView {
            ZStack{
                NavigationView{
                VStack(alignment:.leading){

                    ZStack(alignment:.topLeading){
                        ScrollView{

                           VStack(){
                                HStack{
                                        NavigationPart()
                                    .padding(.bottom,40)

                                    Spacer()

                                        CartButton()
                                            .padding()
                                }//hstack1
                                .frame(width: 390, height: 80)
                                .padding(.top,50)

                                VStack(spacing:0){

                                    SearchButton(text: $text)
                                        .padding(.bottom)
                                        .padding(.horizontal)

                                    AnimatedStacks()
                                        .padding(.horizontal,10)

                                    Prescription()
                                        .padding(.vertical)

                                    Title(title:"Special Deals")
                                        .padding(.horizontal,20)
                                    
                                    Specialdeals()
                                        .padding(.horizontal,10)

                                    SectionTitleAll(title: "Hair & skin suppliments", titleAll: "see all",type: "Hair Care")
                                        .padding(.horizontal,10)


//                                    ListOfItems(items: items)
//                                    .padding(.horizontal,20)

                                    Image("a5")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.vertical)

                                    Title(title: "Personal Care",titleAll: "")
                                        .padding(5)
                                        .padding(.horizontal,10)
                                    PersonalCare()
                                }
                               Title(title: "Lab Tests and packages",titleAll: "")
                                   .padding(5)
                                   .padding(.horizontal,10)
                                   
                                    .padding(.horizontal,20)

                                Checking()


                                Image("a7")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.vertical)

                                ListOfItems(items: items)
                                .padding(.horizontal,20)

                                NavigationLink {
                                    Text("aa")
                                } label: {
                                    Image("a2")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.vertical)
                                }
                               
                               SectionTitleAll(title: "Face Care products", titleAll: "see all",type: "Facecare")
                                   .padding(.horizontal,10)

                                Sunsine()

                            }

                        }//ScrollView
                        
                        if mainViewModel.seletectedTab == 4 {
                            ProfileView()
                        }

                    }//2ndZstack
                    MainTabView()
                }//VStack
                .ignoresSafeArea()

            } //NavigationView

            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
                
                
            
            .background(  LinearGradient(colors: [Color.orange.opacity(0.1),Color.white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            )
            .ignoresSafeArea(edges: .bottom)
            
                .background(
                    NavigationLink(destination: HealthPlansView(),
                                   isActive: $mainViewModel.goToPlan) {
                                       EmptyView()
                                   })
            
                .background(
                    NavigationLink(destination: AddvertiseView(),
                                   isActive: $mainViewModel.goToAdd) {
                                       EmptyView()
                                   })
                .background(
                    NavigationLink(destination: LabTestsView(),
                                   isActive: $mainViewModel.goToDoc) {
                                       EmptyView()
                                   })
                
                
                if mainViewModel.show {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                    PrescriptionView()
                        .padding(.top,610)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }

                
        }//ZStack
    }//Body

}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView {
        HomeView()
            .environmentObject(MainViewModel())
            .environmentObject(UserViewModel())
        //.navigationTitle("aaa")
        // }

    }
}

