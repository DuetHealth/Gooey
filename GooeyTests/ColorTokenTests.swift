import Foundation
import Testing
@testable import Gooey

struct ColorTokenTests {

    @Test func initializingWithHSV() {
        let actualRed = ColorToken(hue: 0, saturation: 1, value: 1)
        let expectedRed = ColorToken.red
        #expect(actualRed.red == expectedRed.red)
        #expect(actualRed.green == expectedRed.green)
        #expect(actualRed.blue == expectedRed.blue)
        let actualPurple = ColorToken(hue: 5 / 6, saturation: 1, value: 0.498)
        let expectedPurple = ColorToken.purple
        #expect(actualPurple.red == expectedPurple.red)
        #expect(actualPurple.green == expectedPurple.green)
        #expect(actualPurple.blue == expectedPurple.blue)
        let randomBlack = ColorToken(hue: .random(in: 0...1), saturation: .random(in: 0...1), value: 0)
        let expectedBlack = ColorToken.black
        #expect(randomBlack.red == expectedBlack.red)
        #expect(randomBlack.green == expectedBlack.green)
        #expect(randomBlack.blue == expectedBlack.blue)
        let randomWhite = ColorToken(hue: .random(in: 0...1), saturation: 0, value: 1)
        let expectedWhite = ColorToken.white
        #expect(randomWhite.red == expectedWhite.red)
        #expect(randomWhite.green == expectedWhite.green)
        #expect(randomWhite.blue == expectedWhite.blue)
    }

    @Test func accessingHue() {
        #expect(ColorToken.red.hue == 0)
        #expect(ColorToken.purple.hue == CGFloat(5) / CGFloat(6))
        #expect(ColorToken.white.hue == 0)
        #expect(ColorToken.black.hue == 0)
    }

    @Test func accessingSaturation() {
        #expect(ColorToken.red.saturation == 1)
        #expect(ColorToken.black.saturation == 0)
        #expect(ColorToken.white.saturation == 0)
    }

    @Test func accessingValue() {
        #expect(ColorToken.red.value == 1)
        #expect(ColorToken.black.value == 0)
        #expect(ColorToken.white.value == 1)
        let purpleValue = ColorToken.purple.value
        #expect(abs(purpleValue - 0.498) < 0.0001)
    }

}
