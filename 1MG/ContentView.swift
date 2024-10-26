import SwiftUI

struct ContentView: View {
    @State private var activeButtonIndex: Int? = nil

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<3) { index in
                Button(action: {
                    
                    if activeButtonIndex == index {
                      
                        activeButtonIndex = nil
                    } else {
                       
                        activeButtonIndex = index
                    }
                }) {
                    Text("Button \(index + 1)")
                        .frame(width: 200, height: 50)
                        .background(activeButtonIndex == index ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
