////
////  DemoCode.swift
////  1MG
////
////  Created by Yashom on 24/10/24.
////
//
////
////  HomeView.swift
////  1MG
////
////  Created by Yashom on 08/10/24.
////
//
//import SwiftUI
//
//struct HomeView: View {
//
//    @EnvironmentObject var mainViewModel:MainViewModel
//    @State var showPrescription:Bool = false
//    var items = ItemsFile().itemCellData
//    @State var navigateToPlans = false
//
//    // @State var navigateToLab = false
//    @State var text :String = ""
//
//    var body: some View {
//        NavigationView {
//            ZStack{
//
//
//                VStack{
//
//                    ZStack{
//
//                        ScrollView{
//                            VStack(){
//                                HStack{
//                                    NavigationLink {
//                                        CitySelectionView()
//                                    } label: {
//
//                                        NavigationPart()
//                                    }
//
//                                    .padding(.bottom,40)
//                                    Spacer()
//                                    NavigationLink {
//                                        mainViewModel.cartview
//                                    } label: {
//                                        CartButton()
//                                            .padding()
//                                    }
//
//                                }
//                                .frame(width: 390, height: 80)
//                                //.background(.blue)
//                                //.padding(.top,50)
//                                // .padding()
//                                // .frame(maxWidth: .infinity,maxHeight: 20)
//
//                                VStack(spacing:0){
//
//                                    //  02240919191
//                                    SearchButton(text: $text)
//                                        .padding(.bottom)
//                                        .padding(.horizontal)
//
//
//                                    AnimatedStacks()
//                                        .padding(.horizontal,10)
//
//                                    Prescription()
//                                        .padding(.vertical)
//
//                                    SectionTitleAll(title: "Special Deals", titleAll: "see more")
//                                        .padding(.horizontal,20)
//                                    Specialdeals()
//                                        .padding(.horizontal,10)
//
//                                    SectionTitleAll(title: "Hair & skin suppliments", titleAll: "see all")
//                                        .padding(.horizontal,10)
//
//
//                                    ScrollView(.horizontal,showsIndicators: false){
//                                        HStack{
//                                            ForEach(0..<6) { index in
//                                                // var item = mainViewModel.cartData[index]
//                                                NavigationLink {
//                                                    withAnimation {
//                                                        DetailItemView(itemData:items[index])
//                                                    }
//
//
//                                                } label: {
//                                                    ItemCell(item:items[index])
//                                                }
//
//                                            }
//                                        }
//                                    }
//                                    .padding(.horizontal,20)
//                                    //second scroll ends
//
//                                    Image("a5")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .padding(.vertical)
//
//                                    SectionTitleAll(title: "Personal care", titleAll: "")
//                                        .padding(5)
//                                        .padding(.horizontal,10)
//                                    PersonalCare()
//                                        //.padding(.horizontal,10)
//
//                                }
//                                SectionTitleAll(title:"Lab testes and packages")
//                                    .padding(.horizontal,20)
//
//
//                                Checking()
//
//
//                                //SectionTitleAll(title:"Lab testes and packages")
//
//                                Image("a7")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .padding(.vertical)
//
//                                ScrollView(.horizontal,showsIndicators: false){
//                                    HStack{
//                                        ForEach(0..<6) { index in
//                                            // var item = mainViewModel.cartData[index]
//                                            NavigationLink {
//                                                withAnimation {
//                                                    DetailItemView(itemData:items[index])
//                                                }
//
//
//                                            } label: {
//                                                ItemCell(item:items[index])
//                                            }
//
//                                        }
//                                    }
//
//                                }
//                                .padding(.horizontal,20)
//                                NavigationLink {
//                                    Text("aa")
//                                } label: {
//                                    Image("a2")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .padding(.vertical)
//                                }
//
//                                Sunsine()
//
//                            }
//
//                        }.navigationBarHidden(true)
//
//                        if mainViewModel.seletectedTab == 4 {
//                            ProfileView()
//                        }
//
//                    }
//
//                    MainTabView()
//                }//VStack
//                if mainViewModel.show {
//                    Color.black.opacity(0.4) // Background overlay
//                        .edgesIgnoringSafeArea(.all)
//                    PrescriptionView()
//                        .padding(.top,500)
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut)
//                }
//
//            }
//            //ZStack
//            .background(  LinearGradient(colors: [Color.orange.opacity(0.1),Color.white], startPoint: .top, endPoint: .bottom)
//            ) .ignoresSafeArea(edges:.bottom)
//
//
//                .background(
//
//
//                    NavigationLink(destination: HealthPlansView(),
//                                                   isActive: $mainViewModel.goToPlan) {
//                                                EmptyView()
//                                            })
//
//                                .background(
//                                    NavigationLink(destination: AddvertiseView(),
//                                                   isActive: $mainViewModel.goToAdd) {
//                                                EmptyView()
//                                            })
//                                .background(
//                                    NavigationLink(destination: LabTestsView(),
//                                                   isActive: $mainViewModel.goToDoc) {
//                                                EmptyView()
//                                            })
//
//
//
//
//                                //Navigation
//        }
//    }//Body
//
//    func show(){
//
//        if mainViewModel.show {
//            PrescriptionView()
//                .padding(.top,580)
//                .transition(.move(edge: .bottom))
//                .animation(.easeInOut)
//
//        }
//
//    }
//}
//
//
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        // NavigationView {
//        HomeView()
//            .environmentObject(MainViewModel())
//        //.navigationTitle("aaa")
//        // }
//
//    }
//}
//
