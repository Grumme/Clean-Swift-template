//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol: class {
    var eventHandler: LoginEventHandlerProtocol { get }
    var viewModel: LoginViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)
}
