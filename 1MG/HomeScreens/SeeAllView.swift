import SwiftUI

struct SeeAllView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var data: [ItemCellData] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack (alignment:.leading){
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    
                    HStack{
                        VStack{
                            
                        }
                        .frame(width: 90, height: 850,alignment: .leading)
                        .background(.orange.opacity(0.2))
                        .padding(.trailing)
                        
                        ScrollView() {
                            
                            VStack{
                                ForEach(data, id: \.self) { item in
                                    ProductItems(item: item)
                                        .padding(5)
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
                let loadedData = try await viewModel.loadItems(ofType: "Facecare")
                data = loadedData
            } catch {
                errorMessage = "Failed to load data: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}

struct SeeAllView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllView()
            .environmentObject(MainViewModel())
    }
}
