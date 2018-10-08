import Foundation
import UIKit

public extension GooeyNamespace where Base: UIView {

    /// Sets the accessibility label of this element as a composed body of labels.
    /// You may use this method for views which could provide composite information
    /// to accessibility users, such as `UITableViewCell`s.
    ///
    /// - Parameter labels: the list of labels from which the composite accessibility label is built.
    public func composeAccessibilityLabel(from labels: [String]) {
        assert(labels.count >= 1, "Cannot build a composite label from zero child labels.")
        base.accessibilityLabel = labels.joined(separator: "; ")
    }

}
