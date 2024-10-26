import SwiftUI

struct OrderedListView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var userViewModel:UserViewModel
    var body: some View {
        NavigationView {
            VStack {
                // Header Section
                Text("Your Order List")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Text("Here’s what you have ordered:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)

                // Check if the cart is empty
                let orderList = userViewModel.fetchCartItems()
                if  orderList.isEmpty {
                    VStack {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        
                        Text("Your cart is empty.")
                            .font(.headline)
                            .padding()
                        
                        Text("Add some items to get started!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    List {
                        ForEach( orderList, id: \.item.id) { cartItem in
                            HStack {
                                // Product Image
                                Image(cartItem.item.itemImages[0]) // Assuming itemImages is an array
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(cartItem.item.itemName)
                                        .font(.headline)
                                        .lineLimit(1)

                                    HStack {
                                        Text("Quantity: \(cartItem.quantity)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)

                                        Spacer()

                                        // System Icon for Price
                                        HStack {
                                            Image(systemName: "creditcard.fill")
                                                .foregroundColor(.green)

                                        }
                                    }
                                }
                                .padding(.leading, 8)

                                Spacer()
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .navigationTitle("Ordered Items")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .padding()
        }
    }
}

struct OrderedListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedListView()
            .environmentObject(MainViewModel())
            .environmentObject(UserViewModel())
    }
}
