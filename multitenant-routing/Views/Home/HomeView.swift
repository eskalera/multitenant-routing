import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text("**Home**")
                .font(.system(size: 24))
            
            Button("**Go to PDP/Grid**") {
                router.navigate(to: .product)
            }
            .padding(.top, 12)
            
        }
        .padding()
    }
}
