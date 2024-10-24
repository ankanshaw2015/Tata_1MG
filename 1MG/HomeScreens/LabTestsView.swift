//
//  LabTestsView.swift
//  1MG
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct LabTestsView: View {
    @EnvironmentObject var mainViewModel:MainViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Title and Subheading
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Lab Tests")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Most upvoted lab tests, sessions and articles for you!")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // Horizontal Scrollable Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(["Blood Test", "Urine Test", "Allergy Test", "Hormone Test"], id: \.self) { category in
                                Button(action: {
                                    // Handle button action
                                }) {
                                    Text(category)
                                        .font(.system(size: 16))
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .foregroundColor(.red)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 60)  // Ensure a fixed height for the button row
                    }
                    
                    // Promotional Card 1: Toothsi by MakeO
                    VStack(alignment: .leading, spacing: 10) {
                       
                        
                        Image("beato")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Toothsi by MakeO - Lab Test Options")
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom tests action
                            }) {
                                Text("Get custom tests")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Promotional Card 2: Twin Health
                    VStack(alignment: .leading, spacing: 10) {
                    
                        Image("birla_firtility")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Birla Fertility & IVF Lab Tests")
                            .font(.headline)
                        
                        Button(action: {
                            // Enroll now action
                        }) {
                            Text("Enroll Now")
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Promotional Card 3: Birla Fertility & IVF
                    VStack(alignment: .leading, spacing: 10) {
                        Image("twino")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Get your Lab Tests Done with Twin Health")
                            .font(.headline)
                            .padding(.top, 5)
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom tests action
                            }) {
                                Text("Get custom tests")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Promotional Card 4: Beato
                    VStack(alignment: .leading, spacing: 10) {
                        Image("toothsi")  // Replace with actual image asset
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        Text("Beato: Comprehensive Lab Tests")
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                // Know more action
                            }) {
                                Text("Know more")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Get custom tests action
                            }) {
                                Text("Get custom tests")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                .onDisappear{
                    mainViewModel.seletectedTab = 0
                }
            }
        }
    }
}

struct LabTestsView_Previews: PreviewProvider {
    static var previews: some View {
        LabTestsView()
    }
}