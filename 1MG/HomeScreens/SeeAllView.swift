import SwiftUI

struct SeeAllView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var data: [ItemCellData] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State var type :String = "Facecare"

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
                            Text("⭐️")
                                .font(.system(size: 60))
                                .frame(width: 75, height: 80,alignment: .top)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.top,60)
                                .padding(.horizontal,7)
                            Text(type)
                                .bold()
                                .background(.orange.opacity(0.3))
                        }
                        .frame(width: 90, height: 850,alignment: .topLeading)
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
                let loadedData = try await viewModel.loadItems(ofType: type)
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
