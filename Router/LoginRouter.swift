import UIKit

protocol LoginDataPassing {
    var routeModel: RouteModelProtocol? { get set }
}

class LoginRouter: NSObject, LoginDataPassing {
    
    weak var viewController: LoginViewController?
    var routeModel: RouteModelProtocol?
    
    // MARK: Routing
    func navigateToSignUp(source: LoginViewController, destination: SomeViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    func passDataToSignUp(routeModel: RouteModelProtocol?, destination: Any) {
        guard let toVc = destination as? SomeViewController,
            let toPresenter = toVc.eventHandler as? SomePresenter else {
                return
        }
        
        toPresenter.routeModel = routeModel
    }
}

extension LoginRouter: LoginRouterProtocol {
    func routeToSignUp(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let toVc = segue.destination as? SomeViewController else {
                return
            }
            
            passDataToSignUp(routeModel: routeModel, destination: toVc)
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let fromVc = viewController,
                let toVc = storyboard.instantiateViewController(withIdentifier: "SomeViewController") as? SomeViewController else {
                    return
            }
            
            passDataToSignUp(routeModel: routeModel, destination: toVc)
            navigateToSignUp(source: fromVc, destination: toVc)
        }
    }
}

