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

    /// Returns the bottom-most anchor for visible content.
    ///
    /// On the iPhone X, this anchor falls behind the virtual home button for view controllers with
    /// bounds equal the window's bounds.
    var bottomBleedAnchor: NSLayoutYAxisAnchor {
        guard !DeviceCheck.isModelX else { return base.view.bottomAnchor }
        return bottomAnchor
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
        return SafeAreaLayoutGuide(base, useBleed: false)
    }

    /// Returns the safe-area layout guide for the target view controller including its bleed anchor.
    public var bleedArea: UILayoutGuide {
        return SafeAreaLayoutGuide(base, useBleed: true)
    }

}

fileprivate struct DeviceCheck {
    static let isModelX: Bool = {
        let deviceName: String
        #if (arch(i386) || arch(x86_64))
            deviceName = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] as String!
        #else
            var systemInfo = utsname()
            uname(&systemInfo)
            deviceName = NSString(cString: &systemInfo.machine.0, encoding: String.Encoding.utf8.rawValue).map(String.init) ?? ""
        #endif
        return deviceName == "iPhone10,3" || deviceName == "iPhone10,6"
    }()

    private init() { }
}
