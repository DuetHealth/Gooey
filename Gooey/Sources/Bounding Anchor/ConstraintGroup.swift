import Foundation
import UIKit

fileprivate extension NSLayoutConstraint {
    
    var targetsLeading: Bool {
        return firstAttribute == .left || firstAttribute == .leading ||
            firstAttribute == .leftMargin || firstAttribute == .leadingMargin
    }
    
    var targetsTrailing: Bool {
        return firstAttribute == .right || firstAttribute == .trailing ||
            firstAttribute == .rightMargin || firstAttribute == .trailingMargin
    }
    
    var targetsTop: Bool {
        return firstAttribute == .top || firstAttribute == .topMargin
    }
    
    var targetsBottom: Bool {
        return firstAttribute == .bottom || firstAttribute == .bottomMargin
    }
    
}

/// The `ConstraintGroup` type is a factory decorator for applying symmetric changes to grouped
/// `NSLayoutConstraint` objects using a fluent interface.
public class ConstraintGroup<A: LayoutAxis> {

    let constraints: [NSLayoutConstraint]
    private var insets: UIEdgeInsets

    init<A>(constraints: [NSLayoutConstraint], insets: EdgeInsets<A>) {
        self.constraints = constraints
        self.insets = insets.uiInsets
    }

    /// Activates all constraints in the group.
    public func activate() {
        NSLayoutConstraint.activate(constraints)
    }

    /// Deactivates all constraints in the group.
    public func deactivate() {
        NSLayoutConstraint.deactivate(constraints)
    }
    
    /// Transforms the constraint group by increasing the driving constants
    /// by the given values in the direction of the center of the target view.
    public func inset(by insets: EdgeInsets<A>) {
        let adjusted = insets.uiInsets.goo.inset(by: insets.uiInsets)
        self.insets = adjusted
        constraints.forEach {
            if $0.targetsTop { $0.constant = adjusted.top }
            else if $0.targetsLeading { $0.constant = adjusted.left }
            else if $0.targetsBottom { $0.constant = adjusted.bottom }
            else if $0.targetsTrailing { $0.constant = adjusted.right }
        }
    }

    /// Transforms the constraint group by increasing the driving constants
    /// by the given values in the direction of the center of the target view.
    public func outset(by insets: EdgeInsets<A>) {
        let adjusted = insets.uiInsets.goo.outset(by: insets.uiInsets)
        self.insets = adjusted
        constraints.forEach {
            if $0.targetsTop { $0.constant = adjusted.top }
            else if $0.targetsLeading { $0.constant = adjusted.left }
            else if $0.targetsBottom { $0.constant = adjusted.bottom }
            else if $0.targetsTrailing { $0.constant = adjusted.right }
        }
    }
    
    /// Transforms the constraint group by replacing the driving constants
    /// with the given inset values. Any zero or unsupplied values remove
    /// the applicable constant.
    public func replace(with insets: EdgeInsets<A>) {
        self.insets = insets.uiInsets
        constraints.forEach {
            if $0.targetsTop { $0.constant = self.insets.top }
            else if $0.targetsLeading { $0.constant = self.insets.left }
            else if $0.targetsBottom { $0.constant = self.insets.bottom }
            else if $0.targetsTrailing { $0.constant = self.insets.right }
        }
    }
    
    /// Transforms the constraint group by patching the driving constants
    /// with the given inset values. Any zero or unsupplied values denote
    /// no change to the applicable constant.
    public func patch(with insets: EdgeInsets<A>) {
        let current = insets.uiInsets
        let patch = insets.uiInsets
        self.insets = UIEdgeInsets(
            top: patch.top == 0 ? current.top : patch.top,
            left: patch.left == 0 ? current.left : patch.left,
            bottom: patch.bottom == 0 ? current.bottom : patch.bottom,
            right: patch.right == 0 ? current.right : patch.right
        )
        constraints.forEach {
            if $0.targetsTop { $0.constant = self.insets.top }
            else if $0.targetsLeading { $0.constant = self.insets.left }
            else if $0.targetsBottom { $0.constant = self.insets.bottom }
            else if $0.targetsTrailing { $0.constant = self.insets.right }
        }
    }
    
}
