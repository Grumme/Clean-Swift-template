//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

@objc protocol LoginRouterProtocol {
    func routeToSignUp(segue: UIStoryboardSegue?)
}

protocol LoginRouteModelProtocol {
    var routeModel: RouteModelProtocol? { get set }
}
