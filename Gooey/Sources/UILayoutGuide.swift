import Foundation
import UIKit

@MainActor extension UILayoutGuide: BoundingLayoutAnchorTarget { }

@MainActor extension GooeyNamespace where Base: UILayoutGuide {
    
    var boundingAnchor: BoundingLayoutAnchor {
        return BoundingLayoutAnchor(targeting: base)
    }
    
}
