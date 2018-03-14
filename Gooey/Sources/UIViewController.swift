import UIKit

public extension GooeyNamespace where Base: UIViewController {

    /// Returns the top layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s top anchor; on older versions,
    /// this returns the `topLayoutGuide`'s bottom anchor.
    public var topAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.topLayoutGuide.bottomAnchor }
        return base.view.safeAreaLayoutGuide.topAnchor
    }

    /// Returns the bottom layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s bottom anchor; on older versions,
    /// this returns the `bottomLayoutGuide`'s top anchor.
    public var bottomAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.bottomLayoutGuide.topAnchor }
        return base.view.safeAreaLayoutGuide.bottomAnchor
    }

    /// Returns the left layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s left anchor; on older versions,
    /// this returns the view's left anchor.
    public var leftAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.leftAnchor }
        return base.view.safeAreaLayoutGuide.leftAnchor
    }

    /// Returns the right layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s right anchor; on older versions,
    /// this returns the view's right anchor.
    public var rightAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.rightAnchor }
        return base.view.safeAreaLayoutGuide.rightAnchor
    }

    /// Returns the leading layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s left anchor; on older versions,
    /// this returns the view's left anchor.
    public var leadingAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.leadingAnchor }
        return base.view.safeAreaLayoutGuide.leadingAnchor
    }

    /// Returns the right layout anchor for the view controller's view.
    ///
    /// On iOS 11 and above, this returns the `safeAreaLayoutGuide`'s right anchor; on older versions,
    /// this returns the view's right anchor.
    public var trailingAnchor: NSLayoutXAxisAnchor {
        guard #available(iOS 11.0, *) else { return base.view.trailingAnchor }
        return base.view.safeAreaLayoutGuide.trailingAnchor
    }

    /// Returns the safe-area layout guide for the target view controller.
    public var safeArea: UILayoutGuide {
        return SafeAreaLayoutGuide(base)
    }

}
