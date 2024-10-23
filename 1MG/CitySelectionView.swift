//
//  CitySelectionView.swift
//  1MG
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct CitySelectionView: View {

    let allCities = ["Gurgaon", "New Delhi", "Bangalore", "Hyderabad", "Mumbai", "Pune", "Kolkata"]
    @EnvironmentObject var viewModel: MainViewModel
    @State private var searchText = ""
    @State private var isLoading = false // Loading state
    @State private var navigateToHome = false // Navigation state
    
    var filteredCities: [String] {
        if searchText.isEmpty {
            return allCities
        } else {
            return allCities.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        ZStack{
        NavigationView {
            VStack {
                TextField("Search for your city", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
               
                Button(action: {
                    // Action for current location
                }) {
                    HStack {
                        Image(systemName: "location.fill")
                        
                        Text("Use your current location")
                    }
                }
                .padding()
                .foregroundColor(.orange)
                
                // City List filtered by search query
                List(filteredCities, id: \.self) { city in
                    HStack {
                        Image(systemName: "building.2.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 80)
                        Text(city)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .onTapGesture {
                        selectCity(city)
                        
                    }
                }
            }
            .navigationBarTitle("Select City", displayMode: .inline)
        }
                        .background(
//                            NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
//                                EmptyView()
//                            }
                        )
            if isLoading{
                LoadingView()
                    .transition(.move(edge: .trailing))
            }
            
                    }
        }
    
    
    private func selectCity(_ city: String) {
        viewModel.deliveringTo = city
        withAnimation(.easeInOut) {
            isLoading = true
        }
       
        
           // Simulate loading delay before navigating to the home screen
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               isLoading = false
               navigateToHome = true // Trigger navigation to HomeView
           }
       }
}



struct CitySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectionView()
            .environmentObject(MainViewModel())
    }
}
