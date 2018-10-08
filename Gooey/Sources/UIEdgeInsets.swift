//
//  UIEdgeInsets.swift
//  Gooey
//
//  Created by ライアン on 10/4/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation

extension UIEdgeInsets: GooeyCompatible { }

public extension GooeyNamespace where Base == UIEdgeInsets {
    
    /// Returns insets where each inset is equal to the system spacing value.
    public var systemSpacing: UIEdgeInsets {
        return systemSpacingInsets(1)
    }
    
    /// Returns insets where each inset is equal to the system spacing value multiplied by the given multiplier.
    public func systemSpacingInsets(_ multiplier: CGFloat) -> UIEdgeInsets {
        return systemSpacingInsets(top: multiplier, left: multiplier, bottom: multiplier, right: multiplier)
    }
    
    /// Returns insets where each inset is equal to the system spacing value multiplied by the given multiplier for that inset.
    public func systemSpacingInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat.goo.systemSpacing * top, left: CGFloat.goo.systemSpacing * left, bottom: CGFloat.goo.systemSpacing * bottom, right: CGFloat.goo.systemSpacing * right)
    }
    
}
