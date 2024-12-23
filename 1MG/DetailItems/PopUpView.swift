//
//  PopUpView.swift
//  1MG
//
//  Created by Yashom on 17/10/24.
//

import SwiftUI

struct PopupView: View {
//    @Binding var addedItems: Int
//    @Binding var isPresented: Bool
    @State var isSelected : Bool = false
//    let options: [String]
//
//    @Binding var item : ItemCellData
    
    @Binding var addedItems: Int
        @Binding var isPresented: Bool
        @Binding var item: ItemCellData // Add this binding
        let options: [String]
    
    @EnvironmentObject var viewModel:MainViewModel

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("Select an Option")
                    .font(.headline)
                
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectItem(option)
                        isPresented = false
                        viewModel.addQuantity(for: item,quantity: Int(option) ?? 10)
                        
                    }) {
                        HStack{
                            Text(option)
                                //.frame(maxWidth: .infinity)
                                .padding()
                               // .background(Color.blue)
                               // .foregroundColor(.white)
                                .cornerRadius(5)
                            
                            Spacer()
                            Image(systemName: addedItems == Int(option) ? "checkmark.circle.fill":"plus.circle")
                                .foregroundColor(addedItems == Int(option) ? .orange : .black)
                        }
                        .background(addedItems == Int(option) ? .orange.opacity(0.2) : .white)
                       
                    }
                }
                
                Button("Clear Items") {
                    addedItems = 0 // Clear the selected items
                    isPresented = false // Dismiss the popup
                    viewModel.minimizeQuantity(for: item,quantity: 0)
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }

    private func selectItem(_ item: String) {
        addedItems = Int(item) ?? 10
        isSelected = true
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
