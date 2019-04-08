import Foundation
import UIKit

extension CGFloat: GooeyCompatible { }

public extension GooeyNamespace where Base == CGFloat.Type {
    
    /// Returns the standard system spacing value.
    var systemSpacing: CGFloat {
        return 8
    }
    
    /// Returns the suggested minimum dimension for touch targets.
    var touchTargetDimension: CGFloat {
        return 44
    }

    /// Returns a multiple of the standard system spacing value.
    func systemSpacing(multiplier: CGFloat) -> CGFloat {
        return systemSpacing * multiplier
    }
        
}
