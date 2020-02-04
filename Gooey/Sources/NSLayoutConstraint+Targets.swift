import UIKit

extension NSLayoutConstraint {

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
