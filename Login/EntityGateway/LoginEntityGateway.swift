import Foundation

class LoginEntityGateway {
    weak var interactor: LoginInteractorProtocol?
    lazy var storage = AppStorage.self
    lazy var config = AppContext.configuration

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
}

extension LoginEntityGateway: LoginEntityGatewayProtocol {
    
}
