import Foundation
import UIKit

extension UIControl.Event: GooeyCompatible { }

extension GooeyNamespace where Base == UIControl.Event.Type {

    /// Any event to which the `.touchDownInside` event transitions.
    public var endedTouchDown: UIControl.Event {
        return [.touchDragExit, .touchUpOutside, .touchDragOutside, .touchUpInside]
    }

}
