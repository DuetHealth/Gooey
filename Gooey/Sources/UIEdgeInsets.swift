import Foundation
import UIKit

extension UIEdgeInsets: GooeyCompatible {

    public var goo: GooeyNamespace<UIEdgeInsets> {
        return GooeyNamespace(base: self)
    }

}

public extension GooeyNamespace where Base == UIEdgeInsets.Type {
    
    /// Returns insets where each inset is equal to the system spacing value.
    var systemSpacing: UIEdgeInsets {
        return systemSpacingInsets(1)
    }
    
    /// Returns insets where each inset is equal to the system spacing value multiplied by the given multiplier.
    func systemSpacingInsets(_ multiplier: CGFloat) -> UIEdgeInsets {
        return systemSpacingInsets(top: multiplier, left: multiplier, bottom: multiplier, right: multiplier)
    }
    
    /// Returns insets where each inset is equal to the system spacing value multiplied by the given multiplier for that inset.
    func systemSpacingInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat.goo.systemSpacing * top, left: CGFloat.goo.systemSpacing * left, bottom: CGFloat.goo.systemSpacing * bottom, right: CGFloat.goo.systemSpacing * right)
    }

}

public extension GooeyNamespace where Base == UIEdgeInsets {
    
    func inset(by insets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: base.top + insets.top, left: base.left + insets.left, bottom: base.bottom + insets.bottom, right: base.right + insets.right)
    }
    
    func outset(by insets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: base.top - insets.top, left: base.left - insets.left, bottom: base.bottom - insets.bottom, right: base.right - insets.right)
    }
    
}
