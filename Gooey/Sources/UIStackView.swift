import Foundation
import UIKit

extension GooeyNamespace where Base: UIStackView {

    /// Adds multiple arranged subviews in the order in which they are supplied.
    ///
    /// - Parameter subviews: variadic views to add as subviews
    public func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(base.addArrangedSubview(_:))
    }

    /// Adds multiple arranged subviews in the order in which they are supplied.
    ///
    /// - Parameter subviews: an array of views to add as subviews
    public func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(base.addArrangedSubview(_:))
    }

    /// Replaces the stack view's existing subviews, if any, with the supplied list of new subviews.
    ///
    /// - Parameter subviews: variadic views to add as subviews
    public func replaceArrangedSubviews(with subviews: UIView...) {
        base.arrangedSubviews.forEach {
            base.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        addArrangedSubviews(subviews)
    }

    /// Replaces the stack view's existing subviews, if any, with the supplied list of new subviews.
    ///
    /// - Parameter subviews: an array of views to add as subviews
    public func replaceArrangedSubviews(with subviews: [UIView]) {
        base.arrangedSubviews.forEach {
            base.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        addArrangedSubviews(subviews)
    }

}
