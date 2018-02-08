import Foundation

/// Encapsulates custom behaviors on types with a "proxy namespace" struct to avoid name conflicts.
/// Any definitions are called similar to
/// ```
/// stackView.topAnchor.constraint(equalTo: goo.topAnchor).isActive = true
/// ```
public struct GooeyNamespace<Base> {

    let base: Base

    internal init(base: Base) {
        self.base = base
    }

}
