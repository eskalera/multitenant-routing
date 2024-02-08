import SwiftUI

@main
struct RoutingApp: App {
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView()
                    .navigationDestination(for: ViewFactory.ViewIdentifier.self) { identifier in
                        identifier.createView()
                    }
            }
            .environmentObject(router)
        }
    }
}
