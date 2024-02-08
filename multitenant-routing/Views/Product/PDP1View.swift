import SwiftUI

protocol ProductViewProtocol: View {
}

struct PDP1View: View, ProductViewProtocol {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Image(systemName: "tshirt.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text("**PDP 1**")
                .font(.system(size: 24))
                .padding(.top, 12)
            
            Button("**Go to Cart with productId from json**") {
                router.navigate(to: .cart)
            }
            .padding(.top, 12)
            
            
            Button {
                router.navigateBack()
            } label: {
                Text("Back")
            }
            .padding(.top, 4)
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}
