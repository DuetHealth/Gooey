import Foundation
import UIKit

@available(iOS 11.0, *)
public extension GooeyNamespace where Base: NSLayoutXAxisAnchor {
    
    /// Returns a constraint which defines that the current anchor trails the specified anchor by the system spacing value.
    public func constraintEqualToSystemSpacingAfter(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return base.constraintEqualToSystemSpacingAfter(anchor, multiplier: 1)
    }
    
    /// Returns a constraint that defines by how much the current anchor leads the specified anchor.
    ///
    /// The distance between the two anchors is determined by multiplying the system spacing by the value in the multiplier parameter.
    public func constraintEqualToSystemSpacingBefore(_ anchor: NSLayoutXAxisAnchor, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        return base.constraint(equalTo: anchor, constant: multiplier * -CGFloat.goo.systemSpacing)
    }

    /// Creates and returns a layout guide with leading and trailing anchors constrained between this
    /// anchor and the argument anchor contained within the specified view.
    public func guide(to other: NSLayoutXAxisAnchor, in view: UIView) -> UILayoutGuide {
        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)
        guide.leadingAnchor.constraint(equalTo: base).isActive = true
        guide.trailingAnchor.constraint(equalTo: other).isActive = true
        return guide
    }
    
}

@available(iOS 11.0, *)
public extension GooeyNamespace where Base: NSLayoutYAxisAnchor {
    
    /// Returns a constraint which defines that the current anchor is positioned below the specified anchor by the system spacing value.
    public func constraintEqualToSystemSpacingBelow(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return base.constraintEqualToSystemSpacingBelow(anchor, multiplier: 1)
    }
    
    /// Returns a constraint that defines by how much the current anchor is positioned the specified anchor by the system spacing value.
    public func constraintEqualToSystemSpacingAbove(_ anchor: NSLayoutYAxisAnchor, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        return base.constraint(equalTo: anchor, constant: multiplier * -CGFloat.goo.systemSpacing)
    }
    
    public func constraintLessThanOrEqualToSystemSpacingAbove(_ anchor: NSLayoutYAxisAnchor, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        return base.constraint(lessThanOrEqualTo: anchor, constant: multiplier * -CGFloat.goo.systemSpacing)
    }
    
    /// Creates and returns a layout guide with leading and trailing anchors constrained between this
    /// anchor and the argument anchor contained within the specified view.
    public func guide(to other: NSLayoutYAxisAnchor, in view: UIView) -> UILayoutGuide {
        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)
        guide.topAnchor.constraint(equalTo: base).isActive = true
        guide.bottomAnchor.constraint(equalTo: other).isActive = true
        return guide
    }
    
}
