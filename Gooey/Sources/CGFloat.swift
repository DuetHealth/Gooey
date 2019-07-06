import Foundation
import UIKit

extension CGFloat: GooeyCompatible { }

public extension GooeyNamespace where Base == CGFloat.Type {

    /// Returns the point size for 1 pixel of operating device's main screen.
    var hairline: CGFloat {
        return 1 / UIScreen.main.scale
    }
    
    /// Returns the standard system spacing value.
    var systemSpacing: CGFloat {
        return 8
    }
    
    /// Returns the suggested minimum dimension for touch targets.
    var touchTargetDimension: CGFloat {
        return 44
    }

    /// Returns a multiplier of the point size for 1 pixel of operating device's
    /// main screen.
    func hairline(multiplier: CGFloat) -> CGFloat {
        return hairline * multiplier
    }

    /// Returns a multiple of the standard system spacing value.
    func systemSpacing(multiplier: CGFloat) -> CGFloat {
        return systemSpacing * multiplier
    }
        
}
