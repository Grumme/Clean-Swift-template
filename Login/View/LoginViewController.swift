//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var eventHandler: LoginEventHandlerProtocol = LoginPresenter(viewController: self)
    
    var viewModel: LoginViewModel? {
        didSet {
            refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Interface Builder Outlets
    
    // MARK: Interface Builder Actions
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        eventHandler.prepare(for: segue)
    }
}

extension LoginViewController {
    func refresh() {
        assert(Thread.isMainThread)
        //Do something
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    
}

