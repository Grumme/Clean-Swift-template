import Foundation

protocol LoginViewControllerProtocol: class {
    var eventHandler: LoginPresenterEventHandlerProtocol { get }
    var viewModel: LoginViewModel? { get set }
}
