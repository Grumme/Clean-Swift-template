//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginRouter: NSObject, RouterProtocol {

    weak var viewController: LoginViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: LoginViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension LoginRouter: LoginRouterProtocol {
    
}
