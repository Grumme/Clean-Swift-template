import UIKit

class LoginPresenter {
    weak var viewController: LoginViewController?
    lazy var interactor: LoginInteractorProtocol = LoginInteractor(presenter: self)
    
    var routeModel: RouteModelProtocol?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func refreshViewModel() {
        guard let viewModel = viewController?.viewModel else { return }
        
        let newViewModel = LoginViewModel()
        viewController?.viewModel = newViewModel
    }
    
    func setRouteModel(model: LoginRouteModel) {
        self.routeModel = model
        
        //Pass stuff to ViewModel from another VC
        let viewModel = LoginViewModel()
        viewController?.viewModel = viewModel
    }
}

extension LoginPresenter: LoginEventHandlerProtocol {
    
    func didTapSignUpButton() {
//        viewController?.performSegue(withIdentifier: "SignUp", sender: viewController)
//        viewController.router.routeToSignUp(segue: nil)
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    //Present something from the interactor
}

