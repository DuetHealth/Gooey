import Foundation
import UIKit

public protocol ConstraintRepresentable {

    var constraints: [NSLayoutConstraint] { get }

}

public extension GooeyNamespace where Base == NSLayoutConstraint.Type {

    /// The effect of this method is the same as setting the
    ///     [isActive](apple-reference-documentation://hsRIb14KxL) property of
    ///     each constraint to `true`.
    ///
    /// - Parameter constraintRepresentable: A constraint representable
    ///      conforming object to be activated.
    func activate(_ constraintRepresentable: ConstraintRepresentable) {
        NSLayoutConstraint.activate(constraintRepresentable.constraints)
    }

    /// The effect of this method is the same as setting the
    ///     [isActive](apple-reference-documentation://hsRIb14KxL) property of
    ///     each constraint to `false`.
    ///
    /// - Parameter constraintRepresentable: A constraint representable
    ///      conforming object to be deactivated.
    func deactivate(_ constraintRepresentable: ConstraintRepresentable) {
        NSLayoutConstraint.deactivate(constraintRepresentable.constraints)
    }

}

extension NSLayoutConstraint: ConstraintRepresentable {

    public var constraints: [NSLayoutConstraint] {
        return [self]
    }

}

extension Array: ConstraintRepresentable where Element: ConstraintRepresentable {

    public var constraints: [NSLayoutConstraint] {
        return reduce(into: [], { $0.append(contentsOf: $1.constraints) })
    }

}
