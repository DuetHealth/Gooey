//
//  NSLayoutConstraint.swift
//  Gooey
//
//  Created by James Power on 5/20/20.
//  Copyright © 2020 Duet Health. All rights reserved.
//

import Foundation
import UIKit

@MainActor public extension GooeyNamespace where Base: NSLayoutConstraint {

    @discardableResult func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        base.priority = priority
        return base
    }

}
