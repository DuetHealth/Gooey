import Foundation
import UIKit

/// The `SafeAreaLayoutGuide` is a custom layout guide designed to provide backwards-compatible
/// references to a view controller's safe area. On iOS 10 and below, this uses the top and bottom
/// layout guides. On iOS 11 and above, this uses the view's safe-area layout guide.
open class SafeAreaLayoutGuide: UILayoutGuide {

    private let target: UIViewController

    internal init(_ viewController: UIViewController) {
        target = viewController
        super.init()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override var topAnchor: NSLayoutYAxisAnchor {
        return target.goo.topAnchor
    }

    open override var leftAnchor: NSLayoutXAxisAnchor {
        return target.goo.leftAnchor
    }

    open override var bottomAnchor: NSLayoutYAxisAnchor {
        return target.goo.bottomAnchor
    }

    open override var rightAnchor: NSLayoutXAxisAnchor {
        return target.goo.rightAnchor
    }

    open override var leadingAnchor: NSLayoutXAxisAnchor {
        return target.goo.leadingAnchor
    }

    open override var trailingAnchor: NSLayoutXAxisAnchor {
        return target.goo.trailingAnchor
    }

}
