//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginRouter: NSObject, LoginRouteModelProtocol {
    
    weak var viewController: LoginViewController?
    var routeModel: RouteModelProtocol?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension LoginRouter: LoginRouterProtocol {
    func routeToSignUp(segue: UIStoryboardSegue?) {
        //Segue
//        guard let toVc = segue?.destination as? SomeViewController,
//            let toEventHandler = toVc.eventHandler as? SomePresenter,
//            let routeModel = routeModel as? SomeRouteModel else {
//                print("Error: Could not segue to SomeViewController")
//                return
//        }
//
//        print("Route: From Main to SomeViewController")
//
//        let router = SomeRouter(viewController: toVc)
//        toEventHandler.router = router
//        toEventHandler.setRouteModel(model: routeModel)
        
        //Routing
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let fromVc = viewController as? LoginViewController,
//            let toVc = storyboard.instantiateViewController(withIdentifier: "SomeViewController") as? SomeViewController,
//            let toEventHandler = toVc.eventHandler as? SomePresenter else {
//                assertionFailure("Could not instantiate rootViewController")
//                return
//        }
//
//        let router = SomeRouter(viewController: toVc)
//        toEventHandler.router = router
//
//        fromVc.navigationController?.pushViewController(toVc, animated: true)

    }
}
