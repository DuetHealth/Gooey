import Foundation
import UIKit

extension UIEdgeInsets: GooeyCompatible {
    
    public var goo: GooeyNamespace<UIEdgeInsets> {
        return GooeyNamespace(base: self)
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
