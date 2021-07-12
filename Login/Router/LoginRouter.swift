//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginRouter: NSObject {

    weak var viewController: LoginViewController?

    init(viewController: LoginViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension LoginRouter: LoginRouterProtocol {
    var routeModel: RouteModelProtocol?
}
