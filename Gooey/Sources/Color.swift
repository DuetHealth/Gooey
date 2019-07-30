import Foundation
import UIKit

#if !canImport(SwiftUI)
public typealias Color = ColorToken
#endif

/// Provides a unified convenience API for colors with a focus on brevity.
///
/// You should prefer using this type only by its exported typealias: `ColorToken` when targeting
/// iOS 13 with SwiftUI or `Color` when targeting iOS 12.
public struct ColorToken {

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

    /// Returns the hue of this color (of degrees out of 360°) represented as a percent in 0...1.
    public var hue: CGFloat {
        if max(red, green, blue) == min(red, green, blue) { return 0 }
        let delta = value - min(percentRed, percentGreen, percentBlue)
        let absolute: CGFloat
        if red >= green && red >= blue {
            absolute = (60 * fmod((percentGreen - percentBlue) / delta, 6)) / 360
        } else if green >= red && green >= blue {
            absolute = (60 * ((percentBlue - percentRed) / delta + 2)) / 360
        } else {
            absolute = (60 * ((percentRed - percentGreen) / delta + 4)) / 360
        }
        return absolute < 0 ? absolute + 1 : absolute
    }

    /// Returns the saturation of this color represented as a percent in 0...1.
    public var saturation: CGFloat {
        return max(red, green, blue) == 0 ? 0 : (value - min(percentRed, percentGreen, percentBlue)) / value
    }

    /// Returns the value of this color represented as a percent in 0...1.
    public var value: CGFloat {
        return max(percentRed, percentGreen, percentBlue)
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

    /// Creates a color from the given hue, saturation, and value on the unit scale (0...1).
    public init(hue: CGFloat, saturation: CGFloat, value: CGFloat, alpha: CGFloat = 1) {
        let c = max(0, min(1, value)) * max(0, min(1, saturation))
        let x = c * (1 - abs(fmod((6 * max(0, min(1, hue))), 2) - 1))
        let m = value - c
        let percentRed: CGFloat
        let percentGreen: CGFloat
        let percentBlue: CGFloat
        switch hue {
        case 0..<(1 / 6):
            percentRed = c
            percentGreen = x
            percentBlue = 0
        case (1 / 6)..<(1 / 3):
            percentRed = x
            percentGreen = c
            percentBlue = 0
        case (1 / 3)..<(1 / 2):
            percentRed = 0
            percentGreen = c
            percentBlue = x
        case (1 / 2)..<(2 / 3):
            percentRed = 0
            percentGreen = x
            percentBlue = c
        case (2 / 3)..<(5 / 6):
            percentRed = x
            percentGreen = 0
            percentBlue = c
        default:
            percentRed = c
            percentGreen = 0
            percentBlue = x
        }
        self.init(percents: percentRed + m, percentGreen + m, percentBlue + m, alpha)
    }
    
    /// Returns a color whose components are tinted by the supplied value.
    public func tinted(by value: UInt8) -> ColorToken {
        let clampToUInt8: (UInt8, UInt8) -> UInt8 = { UInt8(min(Int(UInt8.max), Int($0) + Int($1))) }
        return ColorToken(clampToUInt8(red, value), clampToUInt8(green, value), clampToUInt8(blue, value))
    }
    
    /// Returns a color whose components are shaded by the supplied value.
    public func shaded(by value: UInt8) -> ColorToken {
        let clampToUInt8: (UInt8, UInt8) -> UInt8 = { UInt8(max(0, Int($0) - Int($1))) }
        return ColorToken(clampToUInt8(red, value), clampToUInt8(green, value), clampToUInt8(blue, value))
    }
    
    /// Creates and returns a new color by substituting the red component of this color.
    public func withRed(_ red: UInt8) -> ColorToken {
        return ColorToken(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the green component of this color.
    public func withGreen(_ green: UInt8) -> ColorToken {
        return ColorToken(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the blue component of this color.
    public func withBlue(_ blue: UInt8) -> ColorToken {
        return ColorToken(red, green, blue, alpha)
    }
    
    /// Creates and returns a new color by substituting the alpha component of this color.
    public func withAlpha(_ alpha: UInt8) -> ColorToken {
        return ColorToken(red, green, blue, alpha)
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

public extension ColorToken {
    
    /// The red hue.
    static let red = ColorToken(255, 0, 0)
    
    /// The orange hue.
    static let orange = ColorToken(255, 127, 0)
    
    /// The yellow hue.
    static let yellow = ColorToken(255, 255, 0)
    
    /// The green hue.
    static let green = ColorToken(0, 255, 0)

    /// The cyan hue.
    static let cyan = ColorToken(0, 255, 255)
    
    /// The blue hue.
    static let blue = ColorToken(0, 0, 255)
    
    /// The purple hue.
    static let purple = ColorToken(127, 0, 127)

    /// The magenta hue.
    static let magenta = ColorToken(255, 0, 255)
    
    /// The white color.
    static let white = ColorToken(255, 255, 255)
    
    /// The black color.
    static let black = ColorToken(0, 0, 0)
    
    /// A clear black color.
    static let clear = ColorToken(0, 0, 0, 0)

    /// The given color with alpha 0.
    static func transparent(_ color: ColorToken) -> ColorToken {
        return color.withAlpha(0)
    }
    
    /// The system-appearance red color.
    static let systemRed = ColorToken(255, 59, 48)
    
    /// The system-appearance orange color.
    static let systemOrange = ColorToken(255, 149, 0)
    
    /// The system-appearance yellow color.
    static let systemYellow = ColorToken(255, 204, 0)
    
    /// The system-appearance green color.
    static let systemGreen = ColorToken(76, 217, 100)
    
    /// The system-appearance teal blue color.
    static let systemTealBlue = ColorToken(90, 200, 250)
    
    /// The system-appearance blue color.
    static let systemBlue = ColorToken(0, 122, 255)
    
    /// The system-appearance purple color.
    static let systemPurple = ColorToken(88, 86, 214)
    
    /// The system-appearance pink color.
    static let systemPink = ColorToken(255, 45, 85)
    
}

fileprivate extension UInt8 {
    
    var percent: CGFloat {
        return CGFloat(self) / CGFloat(UInt8.max)
    }
    
}
