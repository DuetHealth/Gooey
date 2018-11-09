import Foundation
import UIKit

public extension GooeyNamespace where Base: UINavigationController {

    /// Pushes a view controller onto the receiver’s stack and updates the display, calling the given
    /// completion block once the animation finishes.
    ///
    /// - Parameters:
    ///   - viewController: The view controller to push onto the stack.
    ///   - animated: Specify true to animate the transition or false if you do not want the
    ///               transition to be animated.
    ///   - completion: a closure that is invoked after the transition animation has completed.
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping (() -> ())) {
        base.pushViewController(viewController, animated: animated)
        guard animated, let coordinator = base.transitionCoordinator else { return completion() }
        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
    
    /// Pops the top view controller on the receiver’s stack and updates the display, calling the given
    /// completion block once the animation finishes.
    ///
    /// - Parameters:
    ///   - animated: Specify true to animate the transition or false if you do not want the
    ///               transition to be animated.
    ///   - completion: a closure that is invoked after the transition animation has completed.
    @discardableResult func popViewController(animated: Bool, completion: @escaping () -> ()) -> UIViewController? {
        let controller = base.popViewController(animated: animated)
        guard animated, let coordinator = base.transitionCoordinator else {
            completion()
            return controller
        }
        coordinator.animate(alongsideTransition: nil) { _ in completion() }
        return controller
    }
    
    /// Pops to the root view controller odf the receiver’s stack and updates the display, calling the given
    /// completion block once the animation finishes.
    ///
    /// - Parameters:
    ///   - animated: Specify true to animate the transition or false if you do not want the
    ///               transition to be animated.
    ///   - completion: a closure that is invoked after the transition animation has completed.
    @discardableResult func popToRootViewController(animated: Bool, completion: @escaping () -> ()) -> [UIViewController]? {
        let controllers = base.popToRootViewController(animated: animated)
        guard animated, let coordinator = base.transitionCoordinator else {
            completion()
            return controllers
        }
        coordinator.animate(alongsideTransition: nil) { _ in completion() }
        return controllers
    }

}
