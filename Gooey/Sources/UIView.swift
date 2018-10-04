import Foundation
import UIKit

extension UIView: BoundingLayoutAnchorTarget { }

public extension GooeyNamespace where Base: UIView {

    /// Returns a layout anchor representing the entire bounds of a view.
    ///
    /// Use this anchor to create multiple homomorphous constraints between a view and its target. The
    /// the result of these operations create contexts for easily applying symmetric changes across the
    /// emitted constraints.
    public var boundingAnchor: BoundingLayoutAnchor {
        return BoundingLayoutAnchor(targeting: base)
    }

    /// Gets or sets the layout margins of the view using an availability-agnostic interface.
    ///
    /// On iOS 11 and above, this gets or sets the `directionalLayoutMargins` of the view; on older
    /// versions, this gets or sets the `layoutMargins`.
    public var layoutMargins: EdgeInsets<Bounds> {
        get {
            if #available(iOS 11.0, *) {
                let margins = base.directionalLayoutMargins
                return .at(top: margins.top, left: margins.leading, bottom: margins.bottom, right: margins.trailing)
            } else {
                let margins = base.layoutMargins
                return .at(top: margins.top, left: margins.left, bottom: margins.bottom, right: margins.right)
            }
        }

        set {
            if #available(iOS 11.0, *) { base.directionalLayoutMargins = newValue.nsInsets }
            else { base.layoutMargins = newValue.uiInsets }
        }
    }

}

