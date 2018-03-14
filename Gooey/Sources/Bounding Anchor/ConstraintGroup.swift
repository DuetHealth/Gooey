//
//  ConstraintGroup.swift
//  Gooey
//
//  Created by Ryan Wachowski on 3/14/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation

/// The `ConstraintGroup` type is a factory decorator for applying symmetric changes to grouped
/// `NSLayoutConstraint` objects using a fluent interface.
public class ConstraintGroup<A: LayoutAxis> {

    let constraints: [NSLayoutConstraint]
    private var insets: UIEdgeInsets

    init<A>(constraints: [NSLayoutConstraint], insets: EdgeInsets<A>) {
        self.constraints = constraints
        self.insets = insets.uiInsets
    }

    /// Activates all constraints in the group.
    public func activate() {
        NSLayoutConstraint.activate(constraints)
    }

    /// Deactivates all constraints in the group.
    public func deactivate() {
        NSLayoutConstraint.deactivate(constraints)
    }

}
