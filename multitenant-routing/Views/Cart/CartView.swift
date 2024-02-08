import SwiftUI

protocol CartViewProtocol: View {
    var productId: String { get set }
}

struct Cart1View: View, CartViewProtocol {
    
    @EnvironmentObject var router: Router
    var productId: String
    
    var body: some View {
        VStack {
            Text("Cart 1 with productId \(productId)")
                .font(.system(size: 36, weight: .bold))
                .padding(.bottom, 12)
            Image(systemName: "cart.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            
            Button {
                router.navigateBack()
            } label: {
                Text("Back to **PDP/Grid**")
            }
            .padding(.top, 12)
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Pop to **Home**")
            }
            .padding(.top, 4)
            
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}
