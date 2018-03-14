import Foundation

/// The `LayoutAxis` protocol acts as a phantom parameterization for `BoundingAnchor` functions.
public protocol LayoutAxis { }

/// A `LayoutAxis` parameterization constrained to the horizontal axis of the target.
public enum HorizontalAxis: LayoutAxis { }

/// A `LayoutAxis` parameterization constrained to the vertical axis of the target.
public enum VerticalAxis: LayoutAxis { }

/// A `LayoutAxis` parameterization encompassing both axes of the target.
public enum Bounds: LayoutAxis { }

/// The `BoundingLayoutAnchor` type is a factory decorator for creating grouped `NSLayoutConstraint`
/// objects using a fluent interface (an interface designed to produce more readable code). Use
/// these constraints to programatically define your layout using Auto Layout.
public struct BoundingLayoutAnchor {

    private let target: UIView

    init(targeting view: UIView) {
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

    /// Constrains the top and bottom bound anchors to the reference layout guide using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - insets: The amount of interior space between the argument bound anchors.
    public func makeVerticalEdges(equalTo layoutGuide: UILayoutGuide, insets: EdgeInsets<VerticalAxis> = .zero) -> ConstraintGroup<VerticalAxis> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            target.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom)
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

    /// Constrains the left and right bound anchors to the reference layout guide using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - insets: The amount of interior space between the argument bound anchors.
    public func makeHorizontalEdges(equalTo layoutGuide: UILayoutGuide, insets: EdgeInsets<HorizontalAxis> = .zero) -> ConstraintGroup<HorizontalAxis> {
        return ConstraintGroup(constraints: [
            target.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left),
            target.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -insets.right)
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

    /// Constrains the leading and trailing bound anchors to the reference layout guide using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the bound anchors are constrained.
    ///   - inset: The amount of interior space between the argument bound anchors.
    public func makeRelativeHorizontalEdges(equalTo layoutGuide: UILayoutGuide, insets: EdgeInsets<HorizontalAxis> = .zero) -> ConstraintGroup<HorizontalAxis> {
        return ConstraintGroup(constraints: [
            target.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left),
            target.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -insets.right),
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

    /// Constrains all bound anchors to the reference layout guide using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - insets: The surrounding insets applied to the receiving view.
    public func makeEdges(equalTo layoutGuide: UILayoutGuide, insets: EdgeInsets<Bounds> = .zero) -> ConstraintGroup<Bounds> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            target.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left),
            target.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom),
            target.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -insets.right)
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

    /// Constrains all bound anchors to the reference view's relative anchors using the given insets.
    ///
    /// - Parameters:
    ///   - view: The view to which the position anchors are constrained.
    ///   - insets: The surrounding insets applied to the receiving view.
    public func makeRelativeEdges(equalTo layoutGuide: UILayoutGuide, insets: EdgeInsets<Bounds> = .zero) -> ConstraintGroup<Bounds> {
        return ConstraintGroup(constraints: [
            target.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            target.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left),
            target.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom),
            target.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -insets.right)
        ], insets: insets)
    }

}
