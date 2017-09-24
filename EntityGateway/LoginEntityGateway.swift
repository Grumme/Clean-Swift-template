import Foundation

class LoginEntityGateway {
    weak var interactor: LoginInteractorProtocol?
    
    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
}

extension LoginEntityGateway: LoginEntityGatewayProtocol {
    
}
