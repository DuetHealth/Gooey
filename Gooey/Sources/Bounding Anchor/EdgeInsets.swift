import Foundation
import UIKit

/// An inset value parameterized by its affected axes.
public struct EdgeInsets<A: LayoutAxis> {

    public static var zero: EdgeInsets<A> {
        return EdgeInsets<A>(uiInsets: .zero)
    }

    let uiInsets: UIEdgeInsets

    @available(iOS 11.0, *)
    var nsInsets: NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: uiInsets.top, leading: uiInsets.left, bottom: uiInsets.bottom, trailing: uiInsets.right)
    }

}

public extension EdgeInsets where A == HorizontalAxis {

    static var systemSpacing: EdgeInsets<A> {
        return EdgeInsets<A>.both(CGFloat.goo.systemSpacing)
    }
    
    static func systemMultiple(_ multiplier: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.both(CGFloat.goo.systemSpacing * multiplier)
    }
    
    static func systemMultiples(left: CGFloat, right: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.at(left: left * CGFloat.goo.systemSpacing, right: right * CGFloat.goo.systemSpacing)
    }
    
    static func both(_ value: CGFloat) -> EdgeInsets<HorizontalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: 0, left: value, bottom: 0, right: value))
    }

    static func at(left: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets<HorizontalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: 0, left: left, bottom: 0, right: right))
    }

    var left: CGFloat {
        return uiInsets.left
    }

    var right: CGFloat {
        return uiInsets.right
    }

}

public extension EdgeInsets where A == VerticalAxis {

    static var systemSpacing: EdgeInsets<A> {
        return EdgeInsets<A>.both(CGFloat.goo.systemSpacing)
    }
    
    static func systemMultiple(_ multiplier: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.both(CGFloat.goo.systemSpacing * multiplier)
    }
    
    static func systemMultiples(top: CGFloat, bottom: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.at(top: top * CGFloat.goo.systemSpacing, bottom: bottom * CGFloat.goo.systemSpacing)
    }
    
    static func both(_ value: CGFloat) -> EdgeInsets<VerticalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: value, left: 0, bottom: value, right: 0))
    }

    static func at(top: CGFloat = 0, bottom: CGFloat = 0) -> EdgeInsets<VerticalAxis> {
        return self.init(uiInsets: UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0))
    }

    var top: CGFloat {
        return uiInsets.top
    }

    var bottom: CGFloat {
        return uiInsets.bottom
    }

}

public extension EdgeInsets where A == Bounds {
    
    static var systemSpacing: EdgeInsets<A> {
        return EdgeInsets<A>.all(CGFloat.goo.systemSpacing)
    }
    
    static func systemMultiple(_ multiplier: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.all(CGFloat.goo.systemSpacing * multiplier)
    }
    
    static func systemMultiples(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets<A> {
        return EdgeInsets<A>.at(top: top * CGFloat.goo.systemSpacing, left: left * CGFloat.goo.systemSpacing, bottom: bottom * CGFloat.goo.systemSpacing, right: right * CGFloat.goo.systemSpacing)
    }
    
    static func all(_ value: CGFloat) -> EdgeInsets<Bounds> {
        return self.init(uiInsets: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }

    static func at(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> EdgeInsets<Bounds> {
        return self.init(uiInsets: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    static func byAxis(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> EdgeInsets<Bounds> {
        return self.init(uiInsets: UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal))
    }

    var left: CGFloat {
        return uiInsets.left
    }

    var right: CGFloat {
        return uiInsets.right
    }

    var top: CGFloat {
        return uiInsets.top
    }

    var bottom: CGFloat {
        return uiInsets.bottom
    }

}
