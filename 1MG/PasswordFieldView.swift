import SwiftUI

struct PasswordFieldView: View {
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        HStack {
            if isPasswordVisible {
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40) // Add padding for the button
            } else {
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 40) // Add padding for the button
            }

            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.gray)
                    .padding() // Add padding around the button
            }
            .buttonStyle(PlainButtonStyle()) // Optional: to remove button styling
            .frame(width: 30, height: 30) // Set fixed size for the button
        }
        .padding()
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
