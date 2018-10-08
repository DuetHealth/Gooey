//
//  CGFloat.swift
//  Gooey
//
//  Created by ライアン on 10/4/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat: GooeyCompatible { }

public extension GooeyNamespace where Base == CGFloat.Type {
    
    /// Returns the standard system spacing value.
    public var systemSpacing: CGFloat {
        return 8
    }
    
    /// Returns the suggested minimum dimension for touch targets.
    public var touchTargetDimension: CGFloat {
        return 44
    }

    /// Returns a multiple of the standard system spacing value.
    public func systemSpacing(multiplier: CGFloat) -> CGFloat {
        return systemSpacing * multiplier
    }
        
}
