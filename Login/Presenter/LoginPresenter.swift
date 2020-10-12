//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?
    lazy var interactor: LoginInteractorProtocol = LoginInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & LoginRouterProtocol & LoginRouteModelProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? LoginRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }
    
    // MARK: Routing data
    
    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & LoginRouterProtocol & LoginRouteModelProtocol)? {
        if let view = self.viewController as? LoginViewController {
            return LoginRouter(viewController: view)
        } else {
            return nil
        }
    }
    
    func refreshViewModel() {
        let viewModel = LoginViewModel()
        viewController?.viewModel = viewModel
    }
    
    func setRouteModel(model: LoginRouteModel) {
        self.routeModel = model
    }
}

extension LoginPresenter: LoginEventHandlerProtocol {
    
    func prepare(for segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func didTapSignUpButton() {
//        Segue
//        viewController?.performSegue(withIdentifier: "SignUp", sender: viewController)
//
//        Routing
//        router?.routeToSignUp(segue: nil)
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
}

