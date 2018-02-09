import Foundation

public protocol LayoutAxis { }
public enum HorizontalAxis: LayoutAxis { }
public enum VerticalAxis: LayoutAxis { }
public enum Bounds: LayoutAxis { }

public struct EdgeInsets<A: LayoutAxis> {

    public static var zero: EdgeInsets<A> {
        return EdgeInsets<A>(uiInsets: .zero)
    }

    fileprivate let uiInsets: UIEdgeInsets
}

public extension EdgeInsets where A == HorizontalAxis {

    public static func both(_ value: CGFloat) -> EdgeInsets<HorizontalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: 0, left: value, bottom: 0, right: value))
    }

    public static func at(left: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets<HorizontalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: 0, left: left, bottom: 0, right: right))
    }

    public var left: CGFloat {
        return uiInsets.left
    }

    public var right: CGFloat {
        return uiInsets.right
    }

}

public extension EdgeInsets where A == VerticalAxis {

    public static func both(_ value: CGFloat) -> EdgeInsets<VerticalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: value, left: 0, bottom: value, right: 0))
    }

    public static func at(top: CGFloat = 0, bottom: CGFloat = 0) -> EdgeInsets<VerticalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0))
    }

    public var top: CGFloat {
        return uiInsets.top
    }

    public var bottom: CGFloat {
        return uiInsets.bottom
    }

}

public extension EdgeInsets where A == Bounds {

    public static func all(_ value: CGFloat) -> EdgeInsets<Bounds> {
        return self.init(uiInsets: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }

    public static func at(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets<Bounds> {
        return self.init(uiInsets: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    public var left: CGFloat {
        return uiInsets.left
    }

    public var right: CGFloat {
        return uiInsets.right
    }

    public var top: CGFloat {
        return uiInsets.top
    }

    public var bottom: CGFloat {
        return uiInsets.bottom
    }

}

/// The `BoundingLayoutAnchor` type is a factory decorator for creating grouped `NSLayoutConstraint`
/// objects using a fluent interface (an interface designed to produce more readable code). Use
/// these constraints to programatically define your layout using Auto Layout.
public struct BoundingLayoutAnchor {

    private let target: UIView

    fileprivate init(targeting view: UIView) {
        target = view
    }

    /// Constrains the top and bottom bound anchors to the reference view using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - insets: The amount of interior space between the argument bound anchors.
    public func makeVerticalEdges(equalTo view: UIView, insets: EdgeInsets<VerticalAxis> = .zero) -> ConstraintGroup<VerticalAxis> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            target.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
            ], insets: insets)
    }

    /// Constrains the left and right bound anchors to the reference view using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - insets: The amount of interior space between the argument bound anchors.
    public func makeHorizontalEdges(equalTo view: UIView, insets: EdgeInsets<HorizontalAxis> = .zero) -> ConstraintGroup<HorizontalAxis> {
        return ConstraintGroup(constraints: [
            target.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            target.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right)
            ], insets: insets)
    }

    /// Constrains the leading and trailing bound anchors to the reference view using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - inset: The amount of interior space between the argument bound anchors.
    public func makeRelativeHorizontalEdges(equalTo view: UIView, insets: EdgeInsets<HorizontalAxis> = .zero) -> ConstraintGroup<HorizontalAxis> {
        return ConstraintGroup(constraints: [
            target.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            target.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right),
            ], insets: insets)
    }

    /// Constrains all bound anchors to the reference view using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - insets: The surrounding insets applied to the receiving view.
    public func makeEdges(equalTo view: UIView, insets: EdgeInsets<Bounds> = .zero) -> ConstraintGroup<Bounds> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            target.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            target.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            target.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right)
            ], insets: insets)
    }

    /// Constrains all bound anchors to the reference view's relative anchors using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - insets: The surrounding insets applied to the receiving view.
    public func makeRelativeEdges(equalTo view: UIView, insets: EdgeInsets<Bounds> = .zero) -> ConstraintGroup<Bounds> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            target.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            target.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            target.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
            ], insets: insets)
    }

    /// Constrains the position and dimension anchors to the reference view using a proportional relationship.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - sizeRatio: The ratio of the target anchors to the reference anchors.
    @available(*, deprecated, message: "center(in:sizeRatio:) will be removed in a future version.")
    public func center(in view: UIView, sizeRatio: CGFloat) -> ConstraintGroup<Bounds> {
        return ConstraintGroup(constraints: [
            target.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            target.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            target.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: sizeRatio),
            target.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: sizeRatio)
            ], insets: EdgeInsets<Bounds>.zero)
    }

    /// Constrains the position to the reference view and optionally constrains the dimension anchors
    /// with constant value.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - size: The optional size to apply to the target anchors. If no size is specified, the view
    ///           is free to use its intrinsic content size for layout.
    @available(*, deprecated, message: "center(in:size:) will be removed in a future version.")
    public func center(in view: UIView, size: CGSize? = nil) -> ConstraintGroup<Bounds> {
        let centerConstraints = [
            target.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            target.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        let sizeConstraints: [NSLayoutConstraint]
        switch size {
        case .some(let some): sizeConstraints = [
            target.widthAnchor.constraint(equalToConstant: some.width),
            target.heightAnchor.constraint(equalToConstant: some.height)
            ]
        case .none: sizeConstraints = []
        }
        return ConstraintGroup(constraints: centerConstraints + sizeConstraints, insets: EdgeInsets<Bounds>.zero)
    }

}

/// The `ConstraintGroup` type is a factory decorator for applying symmetric changes to grouped
/// `NSLayoutConstraint` objects using a fluent interface.
public class ConstraintGroup<A: LayoutAxis> {

    let constraints: [NSLayoutConstraint]
    private var insets: UIEdgeInsets

    fileprivate init<A>(constraints: [NSLayoutConstraint], insets: EdgeInsets<A>) {
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

public extension UIView {

    public var goo: GooeyNamespace<UIView> {
        return GooeyNamespace(base: self)
    }

}

public extension GooeyNamespace where Base: UIView {

    /// Returns a layout anchor representing the entire bounds of a view.
    ///
    /// Use this anchor to create multiple homomorphous constraints between a view and its target. The
    /// the result of these operations create contexts for easily applying symmetric changes across the
    /// emitted constraints.
    public var boundingAnchor: BoundingLayoutAnchor {
        return BoundingLayoutAnchor(targeting: base)
    }

}

