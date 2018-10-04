import Foundation
import UIKit

extension UILayoutGuide: BoundingLayoutAnchorTarget { }

extension GooeyNamespace where Base: UILayoutGuide {
    
    var boundingAnchor: BoundingLayoutAnchor {
        return BoundingLayoutAnchor(targeting: base)
    }
    
}
