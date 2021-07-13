//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?
    lazy var interactor: LoginInteractorProtocol = LoginInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & LoginRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? LoginRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & LoginRouterProtocol & RouterProtocol)? {
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

// MARK: Event Handler
extension LoginPresenter: LoginEventHandlerProtocol {
    func prepare(for segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    func didLoad() {
        // Place here component's initial load code
    }

    func willAppear() {
        viewController?.languageRefresh()
    }

    func traitCollectionDidChange() {
        viewController?.themeRefresh()
    }
}

// MARK: Presenter
extension LoginPresenter: LoginPresenterProtocol {

}

