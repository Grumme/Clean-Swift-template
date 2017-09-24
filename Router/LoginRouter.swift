import UIKit

class LoginRouter: NSObject {
    
    weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    // MARK: Routing
    
    func routeToSomewhere(segue: UIStoryboardSegue?, routeModel: RouteModelProtocol?) {
        if let segue = segue {
            guard let toVc = segue.destination as? ShowOrdersViewController,
                  let toPresenter = toVc.eventHandler as? ShowOrdersPresenter,
                  let routeModel = routeModel as? ShowOrdersRouteModel else {
                    return
            }
            
            //Passing data with routeModel
            toPresenter.setRouteModel(model: routeModel)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let toVc = storyboard.instantiateViewController(withIdentifier: "ShowOrdersViewController") as? ShowOrdersViewController,
                let toPresenter = toVc.eventHandler as? ShowOrdersPresenter,
                let routeModel = routeModel as? ShowOrdersRouteModel else {
                    return
            }
            
            //Passing data with routeModel
            toPresenter.setRouteModel(model: routeModel)
            
            navigateToSomewhere(source: viewController!, destination: toVc)
        }
    }
}

extension LoginRouter: LoginRouterProtocol {
    func navigateToSomewhere(source: LoginViewController, destination: ShowOrdersViewController) {
        source.show(destination, sender: nil)
    }
}
