//
//  DemoCode.swift
//  1MG
//
//  Created by Yashom on 24/10/24.
//

//
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

                                    SectionTitleAll(title: "Special Deals", titleAll: "see more")
                                        .padding(.horizontal,20)
                                    Specialdeals()
                                        .padding(.horizontal,10)

                                    SectionTitleAll(title: "Hair & skin suppliments", titleAll: "see all")
                                        .padding(.horizontal,10)


                                    ListOfItems(items: items)
                                    .padding(.horizontal,20)

                                    Image("a5")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.vertical)

                                    SectionTitleAll(title: "Personal care", titleAll: "")
                                        .padding(5)
                                        .padding(.horizontal,10)
                                    PersonalCare()
                                }
                                SectionTitleAll(title:"Lab testes and packages")
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

                                Sunsine()

                            }

                        }//ScrollView
                        
                        if mainViewModel.seletectedTab == 4 {
                            ProfileView()
                        }

                    }//2ndZstack
                  //  .background(.blue)

                    MainTabView()
                }//VStack
               // .frame(width: 390, height: 859,alignment: .topLeading)
               // .background(.green)
                .ignoresSafeArea()
                
                if mainViewModel.show {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                    PrescriptionView()
                        .padding(.top,500)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }

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
                
        }//ZStack
    }//Body

}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView {
        HomeView()
            .environmentObject(MainViewModel())
        //.navigationTitle("aaa")
        // }

    }
}

