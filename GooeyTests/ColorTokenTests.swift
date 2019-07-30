import Foundation
import XCTest
@testable import Gooey

class ColorTokenTests: XCTestCase {

    func testInitializingWithHSV() {
        let actualRed = ColorToken(hue: 0, saturation: 1, value: 1)
        let expectedRed = ColorToken.red
        XCTAssertEqual(actualRed.red, expectedRed.red)
        XCTAssertEqual(actualRed.green, expectedRed.green)
        XCTAssertEqual(actualRed.blue, expectedRed.blue)
        let actualPurple = ColorToken(hue: 5 / 6, saturation: 1, value: 0.498)
        let expectedPurple = ColorToken.purple
        XCTAssertEqual(actualPurple.red, expectedPurple.red)
        XCTAssertEqual(actualPurple.green, expectedPurple.green)
        XCTAssertEqual(actualPurple.blue, expectedPurple.blue)
        let randomBlack = ColorToken(hue: .random(in: 0...1), saturation: .random(in: 0...1), value: 0)
        let expectedBlack = ColorToken.black
        XCTAssertEqual(randomBlack.red, expectedBlack.red)
        XCTAssertEqual(randomBlack.green, expectedBlack.green)
        XCTAssertEqual(randomBlack.blue, expectedBlack.blue)
        let randomWhite = ColorToken(hue: .random(in: 0...1), saturation: 0, value: 1)
        let expectedWhite = ColorToken.white
        XCTAssertEqual(randomWhite.red, expectedWhite.red)
        XCTAssertEqual(randomWhite.green, expectedWhite.green)
        XCTAssertEqual(randomWhite.blue, expectedWhite.blue)
    }

    func testAccessingHue() {
        XCTAssertEqual(ColorToken.red.hue, 0)
        XCTAssertEqual(ColorToken.purple.hue, 5 / 6)
        XCTAssertEqual(ColorToken.white.hue, 0)
        XCTAssertEqual(ColorToken.black.hue, 0)
    }

    func testAccessingSaturation() {
        XCTAssertEqual(ColorToken.red.saturation, 1)
        XCTAssertEqual(ColorToken.black.saturation, 0)
        XCTAssertEqual(ColorToken.white.saturation, 0)
    }

    func testAccessingValue() {
        XCTAssertEqual(ColorToken.red.value, 1)
        XCTAssertEqual(ColorToken.black.value, 0)
        XCTAssertEqual(ColorToken.white.value, 1)
        XCTAssertEqual(ColorToken.purple.value, 0.498, accuracy: 0.0001)
    }

}
