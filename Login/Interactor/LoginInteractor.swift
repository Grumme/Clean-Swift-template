import Foundation

class LoginInteractor {
    
    weak var presenter: LoginPresenterProtocol?
    lazy var entityGateway: LoginEntityGatewayProtocol = LoginEntityGateway(interactor: self)
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }

}

extension LoginInteractor: LoginInteractorProtocol {
    
    //In
    
    //Out
}
