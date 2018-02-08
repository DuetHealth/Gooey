import UIKit

public extension UIViewController {

    public var goo: GooeyNamespace<UIViewController> {
        return GooeyNamespace(base: self)
    }
    
}

public extension GooeyNamespace where Base: UIViewController {

    /// Returns the top layout anchor for the view controller's view.
    ///
    /// On iOS 11+, this returns the `safeAreaLayoutGuide`'s top anchor; on older versions,
    /// this returns the `topLayoutGuide`'s bottom anchor.
    public var topAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.topLayoutGuide.bottomAnchor }
        return base.view.safeAreaLayoutGuide.topAnchor
    }

    /// Returns the bottom layout anchor for the view controller's view.
    ///
    /// On iOS 11+, this returns the `safeAreaLayoutGuide`'s bottom anchor; on older versions,
    /// this returns the `bottomLayoutGuide`'s top anchor.
    public var bottomAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.bottomLayoutGuide.topAnchor }
        return base.view.safeAreaLayoutGuide.bottomAnchor
    }

    /// Returns the left layout anchor for the view controller's view.
    ///
    /// On iOS 11+, this returns the `safeAreaLayoutGuide`'s left anchor; on older versions,
    /// this returns the view's left anchor.
    public var leftAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.leftAnchor }
        return base.view.safeAreaLayoutGuide.leftAnchor
    }

    /// Returns the right layout anchor for the view controller's view.
    ///
    /// On iOS 11+, this returns the `safeAreaLayoutGuide`'s right anchor; on older versions,
    /// this returns the view's right anchor.
    public var rightAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.rightAnchor }
        return base.view.safeAreaLayoutGuide.rightAnchor
    }

}

