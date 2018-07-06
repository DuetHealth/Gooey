import Foundation
import UIKit

extension UIControlEvents: GooeyCompatible { }

extension GooeyNamespace where Base == UIControlEvents.Type {

    /// Any event to which the `.touchDownInside` event transitions.
    public var endedTouchDown: UIControlEvents {
        return [.touchDragExit, .touchUpOutside, .touchDragOutside, .touchUpInside]
    }

}
