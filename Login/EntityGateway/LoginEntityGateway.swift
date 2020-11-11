//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class LoginEntityGateway {
    weak var interactor: LoginInteractorProtocol?

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
}

extension LoginEntityGateway: LoginEntityGatewayProtocol {
    
}
