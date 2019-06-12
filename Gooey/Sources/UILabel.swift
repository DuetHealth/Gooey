import Foundation
import UIKit

extension GooeyNamespace where Base: UILabel {

    @available(iOS 10.0, *)
    func setStyle(_ textStyle: UIFont.TextStyle) {
        base.font = .preferredFont(forTextStyle: textStyle)
        base.adjustsFontForContentSizeCategory = true
    }

}
