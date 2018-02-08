import Foundation

public extension GooeyNamespace where Base: UINavigationController {

    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping (() -> ())) {
        base.pushViewController(viewController, animated: animated)

        guard animated, let coordinator = base.transitionCoordinator else {
            completion()
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }

}
