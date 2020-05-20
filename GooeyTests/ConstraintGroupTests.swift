import Foundation
@testable import Gooey
import Nimble
import Quick
import UIKit

extension Bool: Comparable {

    public static func < (lhs: Bool, rhs: Bool) -> Bool {
        // false < true
        return rhs ? (lhs ? false : true) : false
    }

}

extension NSLayoutConstraint.Attribute {

    var simple: NSLayoutConstraint.Attribute {
        switch self {
        case .left, .leading, .leftMargin, .leadingMargin:
            return .leading
        case .right, .trailing, .rightMargin, .trailingMargin:
            return .trailing
        case .top, .topMargin:
            return .top
        case .bottom, .bottomMargin:
            return .bottom
        default: return self
        }
    }

}

class ConstraintGroupSpec: QuickSpec {

    override func spec() {

        let mockElement1 = UIView()
        let mockElement2 = UIView()

        func constraintsToArray(_ constraints: [NSLayoutConstraint]) -> [CGFloat] {
            return constraints.sorted { (lhs, rhs) in
                (lhs.targetsTop, lhs.targetsLeading, lhs.targetsBottom, lhs.targetsTrailing)
                    > (rhs.targetsTop, rhs.targetsLeading, rhs.targetsBottom, rhs.targetsTrailing)
                }.map {
                    switch ($0.firstAttribute.simple, $0.secondAttribute.simple) {
                    case (.bottom, .top): return -$0.constant
                    case (.right, .left): return -$0.constant
                    default: return $0.constant
                    }
                }
        }

        describe("Modifying ConstraintGroup insets") {

            it ("insets from the previous inset values") {
                let group = mockElement1.goo.boundingAnchor.makeEdges(equalTo: mockElement2)

                group.inset(by: .at(top: 10, left: 10, bottom: 10, right: 10))
                expect(constraintsToArray(group.constraints)).to(equal([10, 10, -10, -10]))
                group.inset(by: .at(top: 5, left: 5, bottom: 5, right: 5))
                expect(constraintsToArray(group.constraints)).to(equal([15, 15, -15, -15]))
            }

            it ("outsets from the previous inset values") {
                let group = mockElement1.goo.boundingAnchor.makeEdges(equalTo: mockElement2)

                group.outset(by: .at(top: 10, left: 10, bottom: 10, right: 10))
                expect(constraintsToArray(group.constraints)).to(equal([-10, -10, 10, 10]))
                group.outset(by: .at(top: 5, left: 5, bottom: 5, right: 5))
                expect(constraintsToArray(group.constraints)).to(equal([-15, -15, 15, 15]))
            }

            it ("patches from the previous inset values") {
                let group = mockElement1.goo.boundingAnchor.makeEdges(equalTo: mockElement2)

                group.patch(with: .at(top: 10, left: 0, bottom: 10, right: 0))
                expect(constraintsToArray(group.constraints)).to(equal([10, 0, -10, 0]))
                group.patch(with: .at(top: 0, left: 5, bottom: 0, right: 5))
                expect(constraintsToArray(group.constraints)).to(equal([10, 5, -10, -5]))
            }

            it ("insets the correct values") {
                let group = mockElement1.goo.boundingAnchor.makeEdges(equalTo: mockElement2, insets: .at(top: 2, left: 4, bottom: 6, right: 7))
                expect(constraintsToArray(group.constraints)).to(equal([2, 4, -6, -7]))
                group.inset(by: .at(top: 2, left: 5, bottom: 8, right: 13))
                expect(constraintsToArray(group.constraints)).to(equal([4, 9, -14, -20]))
                group.inset(by: .at(top: 3, left: -2, bottom: -3, right: 5))
                expect(constraintsToArray(group.constraints)).to(equal([7, 7, -11, -25]))
            }

            it ("allows combinations of insetting and outsetting from the previous inset values") {
                let group = mockElement1.goo.boundingAnchor.makeEdges(equalTo: mockElement2)

                group.outset(by: .at(top: 10, left: 10, bottom: 10, right: 10))
                expect(constraintsToArray(group.constraints)).to(equal([-10, -10, 10, 10]))
                group.inset(by: .at(top: -5, left: -5, bottom: -5, right: -5))
                expect(constraintsToArray(group.constraints)).to(equal([-15, -15, 15, 15]))
                group.outset(by: .at(top: 2, left: -2, bottom: 2, right: -2))
                expect(constraintsToArray(group.constraints)).to(equal([-17, -13, 17, 13]))
            }

        }

    }

}
