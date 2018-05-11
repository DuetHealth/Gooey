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

public protocol GooeyCompatible {

    associatedtype CompatibleType
    var goo: GooeyNamespace<CompatibleType> { get }

}

extension GooeyCompatible {

    public static var goo: GooeyNamespace<Self.Type> {
        return GooeyNamespace(base: Self.self)
    }

    public var goo: GooeyNamespace<Self> {
        return GooeyNamespace(base: self)
    }

}

extension NSObject: GooeyCompatible { }
