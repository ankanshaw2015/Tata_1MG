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


//
//{
//    "id": "21",
//    "itemName": "Scalpe+ Expert Anti Dandruff | Hair Care Shampoo",
//    "itemImages": ["ad1","ad1","ad1"],
//    "itemPrice": "1160.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "22",
//    "itemName": "Keraglo - AD Anti-Dandruff | Hair Care Shampoo Ipca Laboratories Ltd",
//    "itemImages": ["ad4","a4","ad4"],
//    "itemPrice": "1160.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "23",
//    "itemName": "Sebamed Baby Shampoo pH 5.5| Ideal for Newborn's delicate scalp❘ No Tears |",
//    "itemImages": ["ad3","ad3","ad3"],
//    "itemPrice": "360.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "24",
//    "itemName": "ANTI-HAIR FALL Shampoo Podes 5X Hair Pal Bare Anatomy Anti-Hairfall Shampoo | For Hair Care",
//    "itemImages": ["ad2","ad2","ad2"],
//    "itemPrice": "1560.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "25",
//    "itemName": "Vasu Aromatics Essential Oil Eucalyptus",
//    "itemImages": ["bd1","bd1","bd1"],
//    "itemPrice": "1160.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "26",
//    "itemName": "Bliss of Earth Lavender Premium Essential Oil",
//    "itemImages": ["bd4","b4","bd4"],
//    "itemPrice": "1160.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "27",
//    "itemName": "Aravi Organic Eucalyptus Essential Oil For Hair Growth, & Skin Care |",
//    "itemImages": ["bd3","bd3","bd3"],
//    "itemPrice": "360.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//},
//{
//    "id": "28",
//    "itemName": "Kazima Breathe Plus 100% Pure Essential Oil
//",
//    "itemImages": ["bd2","bd2","bd2"],
//    "itemPrice": "1560.00",
//    "deleveryDate": "Delivery by 11pm today",
//    "itemType": "Hair Care",
//    "itemInformation": "Product Information:\nAloe Vera Gel is known for its soothing and moisturizing properties. It is commonly used to treat sunburns, skin irritation, and dry skin. The gel is lightweight and absorbs quickly, making it suitable for all skin types. Apply generously to the skin as needed for instant relief and hydration. Consider keeping it in the refrigerator for an extra cooling effect."
//}

