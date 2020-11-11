//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class LoginInteractor {
    
    weak var presenter: LoginPresenterProtocol?
    lazy var entityGateway: LoginEntityGatewayProtocol = LoginEntityGateway(interactor: self)
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }

}

extension LoginInteractor: LoginInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
}
