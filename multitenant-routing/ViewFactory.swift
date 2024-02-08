import SwiftUI

class ViewFactory {
    static func viewForName(_ viewName: String, params: [String: String]?) -> AnyView {
        switch viewName {
        case "PDP1View":
            return AnyView(PDP1View())
        case "Grid1View":
            return AnyView(Grid1View())
        case "Cart1View":
            if let productId = params?["productId"] {
                return AnyView(Cart1View(productId: productId))
            } else {
                fatalError("CartView requiere un parámetro 'productId'")
            }
        default:
            fatalError("Unknown view name: \(viewName)")
        }
    }
}

extension ViewFactory {    
    struct ViewIdentifier: Hashable {
        let viewName: String
        let params: [String: String]?
        
        func createView() -> AnyView {
            ViewFactory.viewForName(viewName, params: params)
        }
    }
}
