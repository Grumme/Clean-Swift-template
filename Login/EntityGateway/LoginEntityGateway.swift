//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class LoginEntityGateway {
    weak var interactor: LoginInteractorProtocol?
    lazy var storage = AppContext.storage
    lazy var config = AppContext.configuration

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
}

extension LoginEntityGateway: LoginEntityGatewayProtocol {
    
}
