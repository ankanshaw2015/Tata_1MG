import SwiftUI

struct PaymentSuccessfulView: View {
    @State private var isAnimating = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()

            // Success Icon
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .scaleEffect(isAnimating ? 1.2 : 1.0) // Animation effect
                .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }

            Text("Payment Successful!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Thank you for your purchase.")
                .font(.headline)
                .padding(.top, 10)

            Spacer()

            // Return to Home Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                print("Returning to home")
            }) {
                Text("Go Back")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}

struct PaymentSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessfulView()
    }
}
