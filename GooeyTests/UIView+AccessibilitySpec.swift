import Foundation
import Gooey
import Nimble
import Quick

class UIAccessibilityElementExtensionsSpec: QuickSpec {

    override func spec() {

        let mockElement = UIControl()

        describe("Composing UIAccessibilityElement labels") {

            it ("fails a precondition with zero labels") {
                expect(mockElement.goo.composeAccessibilityLabel(from: [])).to(throwAssertion())
            }

            it ("has accessibility label exactly equal to a singleton") {
                mockElement.goo.composeAccessibilityLabel(from: ["Test"])
                expect(mockElement.accessibilityLabel).to(equal("Test"))
            }

            it ("builds an accessibility label separated by semi-colons for multiple child labels") {
                mockElement.goo.composeAccessibilityLabel(from: ["Test", "label"])
                expect(mockElement.accessibilityLabel).to(equal("Test; label"))
            }

        }

    }

}
