import Foundation
import UIKit

#if canImport(SwiftUI)
public typealias ColorToken = _Color
#else
public typealias Color = _Color
#endif

/// Provides a unified convenience API for colors with a focus on brevity.
///
/// You should prefer using this type only by its exported typealias: `ColorToken` when targeting
/// iOS 13 with SwiftUI or `Color` when targeting iOS 12.
public struct _Color {

    /// The location of the alpha component in representations of this value.
    public enum AlphaLocation {
        
        /// The alpha component comes before the color components.
        case leading
        
        /// The alpha component comes after the color components.
        case trailing
        
    }
    
    /// The red component of this color.
    public var red: UInt8
    
    /// The green component of this color.
    public var green: UInt8
    
    /// The blue component of this color.
    public var blue: UInt8
    
    /// The alpha component of this color.
    public var alpha: UInt8
    
    /// Returns the red component of this color represented as a percent.
    public var percentRed: CGFloat {
        return red.percent
    }
    
    /// Returns the green component of this color represented as a percent.
    public var percentGreen: CGFloat {
        return green.percent
    }
    
    /// Returns the blue component of this color represented as a percent.
    public var percentBlue: CGFloat {
        return blue.percent
    }
    
    /// Returns the alpha component of this color represented as a percent.
    public var percentAlpha: CGFloat {
        return alpha.percent
    }
    
    /// Returns the intensity or saturation of the color.
    public var intensity: UInt8 {
        let redFactor = 0.299 * Double(red)
        let greenFactor = 0.587 * Double(green)
        let blueFactor = 0.114 * Double(blue)
        return UInt8(redFactor + greenFactor + blueFactor)
    }
    
    /// Returns whether light colors will appear natural alongside this color.
    ///
    /// This is most useful for determining whether to select a light or dark text color for text
    /// super-imposed over this color.
    public var complementsLightColors: Bool {
        return intensity < 186
    }
    
    /// Returns the `UIColor` which corresponds with this color.
    public var uiColor: UIColor {
        return UIColor(red: percentRed, green: percentGreen, blue: percentBlue, alpha: percentAlpha)
    }
    
    /// Returns the `CGColor` which corresponds with this color.
    public var cgColor: CGColor {
        return uiColor.cgColor
    }
    
    /// Creates a color with the given component values.
    public init(_ red: UInt8, _ green: UInt8, _ blue: UInt8, _ alpha: UInt8 = .max) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    /// Creates a color by calculating the components for the given percents.
    public init(percents red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        let toUInt8: (CGFloat) -> UInt8 = { UInt8(round(CGFloat(UInt8.max) * $0)) }
        self.red = toUInt8(red)
        self.green = toUInt8(green)
        self.blue = toUInt8(blue)
        self.alpha = toUInt8(alpha)
    }
    
    /// Creates a color from the components of the given `UIColor`.
    public init(from uiColor: UIColor) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            fatalError("Could not initialize a Color from a UIColor.")
        }
        let toUInt8: (CGFloat) -> UInt8 = { UInt8(round(CGFloat(UInt8.max) * $0)) }
        self.red = toUInt8(red)
        self.green = toUInt8(green)
        self.blue = toUInt8(blue)
        self.alpha = toUInt8(alpha)
    }
    
    /// Returns a color whose components are tinted by the supplied value.
    public func tinted(by value: UInt8) -> _Color {
        let clampToUInt8: (UInt8, UInt8) -> UInt8 = { UInt8(min(Int(UInt8.max), Int($0) + Int($1))) }
        return _Color(clampToUInt8(red, value), clampToUInt8(green, value), clampToUInt8(blue, value))
    }
    
    /// Returns a color whose components are shaded by the supplied value.
    public func shaded(by value: UInt8) -> _Color {
        let clampToUInt8: (UInt8, UInt8) -> UInt8 = { UInt8(max(0, Int($0) - Int($1))) }
        return _Color(clampToUInt8(red, value), clampToUInt8(green, value), clampToUInt8(blue, value))
    }
    
    /// Creates and returns a new color by substituting the red component of this color.
    public func withRed(_ red: UInt8) -> _Color {
        return _Color(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the green component of this color.
    public func withGreen(_ green: UInt8) -> _Color {
        return _Color(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the blue component of this color.
    public func withBlue(_ blue: UInt8) -> _Color {
        return _Color(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the alpha component of this color.
    public func withAlpha(_ alpha: UInt8) -> _Color {
        return _Color(red, green, blue, alpha)
    }
    
    /// Returns the hex string literal which represents this color.
    ///
    /// - Parameters:
    ///   - hash: whether to include a leading hash sign.
    ///   - alpha: the position of the alpha, if any.
    public func hexStringLiteral(hash: Bool = true, alpha: AlphaLocation? = nil) -> String {
        let toHex: (UInt8) -> String = { String(format: "%.2x", $0) }
        switch alpha {
        case .none: return "\(hash ? "#" : "")\(toHex(red))\(toHex(green))\(toHex(blue))"
        case .some(.leading): return "\(hash ? "#" : "")\(toHex(self.alpha))\(toHex(red))\(toHex(green))\(toHex(blue))"
        case .some(.trailing): return "\(hash ? "#" : "")\(toHex(red))\(toHex(green))\(toHex(blue))\(toHex(self.alpha))"
        }
    }
    
}

public extension _Color {
    
    /// The red hue.
    static let red = _Color(255, 0, 0)
    
    /// The orange hue.
    static let orange = _Color(255, 127, 0)
    
    /// The yellow hue.
    static let yellow = _Color(255, 255, 0)
    
    /// The green hue.
    static let green = _Color(0, 255, 0)

    /// The cyan hue.
    static let cyan = _Color(0, 255, 255)
    
    /// The blue hue.
    static let blue = _Color(0, 0, 255)
    
    /// The purple hue.
    static let purple = _Color(127, 0, 127)
    
    /// The white color.
    static let white = _Color(255, 255, 255)
    
    /// The black color.
    static let black = _Color(0, 0, 0)
    
    /// A clear black color.
    static let clear = _Color(0, 0, 0, 0)
    
    /// The system-appearance red color.
    static let systemRed = _Color(255, 59, 48)
    
    /// The system-appearance orange color.
    static let systemOrange = _Color(255, 149, 0)
    
    /// The system-appearance yellow color.
    static let systemYellow = _Color(255, 204, 0)
    
    /// The system-appearance green color.
    static let systemGreen = _Color(76, 217, 100)
    
    /// The system-appearance teal blue color.
    static let systemTealBlue = _Color(90, 200, 250)
    
    /// The system-appearance blue color.
    static let systemBlue = _Color(0, 122, 255)
    
    /// The system-appearance purple color.
    static let systemPurple = _Color(88, 86, 214)
    
    /// The system-appearance pink color.
    static let systemPink = _Color(255, 45, 85)
    
}

fileprivate extension UInt8 {
    
    var percent: CGFloat {
        return CGFloat(self) / CGFloat(UInt8.max)
    }
    
}
