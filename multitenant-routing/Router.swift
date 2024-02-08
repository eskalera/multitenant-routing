import SwiftUI

final class Router: ObservableObject {
    var routeConfiguration: RouteConfiguration?
    
    @Published var navPath = NavigationPath()
    
    init() {
        routeConfiguration = loadRouteConfiguration()
    }
    
    func navigate(to destination: Destination) {
        guard let route = routeConfiguration?.routes.first(where: { $0.destination == destination.identifier }) else {
            print("No route configuration found for destination \(destination)")
            return
        }
        
        let viewIdentifier = ViewFactory.ViewIdentifier(viewName: route.viewName, params: route.params)
        withAnimation {
            navPath.append(viewIdentifier)
        }
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    private func loadRouteConfiguration() -> RouteConfiguration? {
        guard let url = Bundle.main.url(forResource: "routes", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Error loading JSON")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let configuration = try decoder.decode(RouteConfiguration.self, from: data)
            return configuration
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
}

extension Router {
    enum Destination: Codable, Hashable {
        case product
        case cart
        
        var identifier: String {
            switch self {
            case .product:
                return "product"
            case .cart:
                return "cart"
            }
        }
    }
}

extension Router {
    struct RouteConfiguration: Decodable {
        let routes: [Route]
    }
    
    struct Route: Decodable {
        let destination: String
        let viewName: String
        let params: [String: String]?
    }
    
}
