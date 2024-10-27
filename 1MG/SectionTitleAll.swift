//
//  SectionTitleAll.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = " Title"
    @State var titleAll: String = "View All"
    @State var type = "Facecare"
    @EnvironmentObject var viewModel:MainViewModel
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var data: [ItemCellData] = ItemsFile().itemCellData2

   
    var body: some View {
        
        VStack{
            HStack{
                Text(title)
                    .font(.system(size: 22))
                    .foregroundColor(.primary)
                    .bold()
                    .bold()
                
                Spacer()
                
                
                
                NavigationLink {
                    SeeAllView(type:type)
                    
                } label: {
                    Text(titleAll)
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                        .bold()
                }
            }
            .frame(height: 40)
            VStack (alignment:.leading){
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    
                    HStack{
                        
                        
                        ScrollView(.horizontal) {
                            
                            HStack{
                                ForEach(data, id: \.self) { item in
                                    NavigationLink(destination: DetailItemView(itemData: item)) {
                                        ItemCell(item:item)
                                            .padding(5)
                                    }
                                   
                                }
                            }
                            
                        }
                    }
                    .frame(width:390,alignment: .topLeading)
                   // .background(.blue)
                }
            }
            .onAppear {
                fetchData()
            }
        }
     
    }
    
    func fetchData() {
        isLoading = true
        errorMessage = nil // Reset error message

        Task {
            do {
                // Assuming loadItems is an async function
                let loadedData = try await viewModel.loadItems(ofType: type)
                data = loadedData
            } catch {
                errorMessage = "Failed to load data: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
            .padding(20)
            .environmentObject(MainViewModel())
    }
}
