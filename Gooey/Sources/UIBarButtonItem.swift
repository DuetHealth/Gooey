import Foundation
import UIKit

public extension GooeyNamespace where Base == UIBarButtonItem.Type {

    /// The system action button.
    var action: UIBarButtonItem {
        return systemItem(.action)
    }

    /// The system plus button containing an icon of a plus sign.
    var add: UIBarButtonItem {
        return systemItem(.add)
    }

    /// The system bookmarks button.
    var bookmarks: UIBarButtonItem {
        return systemItem(.bookmarks)
    }

    /// The system camera button.
    var camera: UIBarButtonItem {
        return systemItem(.camera)
    }

    /// The system cancel button, localized.
    var cancel: UIBarButtonItem {
        return systemItem(.cancel)
    }

    /// The system compose button.
    var compose: UIBarButtonItem {
        return systemItem(.compose)
    }

    /// The system done button, localized.
    var done: UIBarButtonItem {
        return systemItem(.done)
    }

    /// The system edit button, localized.
    var edit: UIBarButtonItem {
        return systemItem(.edit)
    }

    /// The system fast forward button.
    var fastForward: UIBarButtonItem {
        return systemItem(.fastForward)
    }

    /// Blank space to add between other items. Only the width property is used when this value is set.
    func fixedSpace(_ spacing: CGFloat) -> UIBarButtonItem {
        let item = systemItem(.fixedSpace)
        item.width = spacing
        return item
    }

    /// Blank space to add between other items. The space is distributed equally between the other items. Other item properties are ignored when this value is set.
    var flexibleSpace: UIBarButtonItem {
        return systemItem(.flexibleSpace)
    }

    /// A button specialized for placement on a toolbar or tab bar.
    var organize: UIBarButtonItem {
        return systemItem(.organize)
    }

    /// The system page curl button.
    @available(*, deprecated, message: "UIBarButtonSystemItemPageCurl is not recommended for apps that run in iOS 7 and later.")
    var pageCurl: UIBarButtonItem {
        return systemItem(.pageCurl)
    }

    /// The system pause button.
    var pause: UIBarButtonItem {
        return systemItem(.pause)
    }

    /// The system play button.
    var play: UIBarButtonItem {
        return systemItem(.play)
    }

    /// The system redo button.
    var redo: UIBarButtonItem {
        return systemItem(.redo)
    }

    /// The system refresh button.
    var refresh: UIBarButtonItem {
        return systemItem(.refresh)
    }

    /// The system reply button.
    var reply: UIBarButtonItem {
        return systemItem(.reply)
    }

    /// The system rewind button.
    var rewind: UIBarButtonItem {
        return systemItem(.rewind)
    }

    /// The system save button.
    var save: UIBarButtonItem {
        return systemItem(.save)
    }

    /// The system search button.
    var search: UIBarButtonItem {
        return systemItem(.search)
    }

    /// The system stop button.
    var stop: UIBarButtonItem {
        return systemItem(.stop)
    }

    /// Creates a new item containing the specified system item.
    func systemItem(_ item: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: item, target: nil, action: nil)
    }

    /// Blank space to add between other items. The width is calculated as a product of the standard system spacing.
    func systemSpace(multiplier: CGFloat) -> UIBarButtonItem {
        return fixedSpace(CGFloat.goo.systemSpacing(multiplier: multiplier))
    }

    /// The system trash button.
    var trash: UIBarButtonItem {
        return systemItem(.trash)
    }

    /// The system undo button.
    var undo: UIBarButtonItem {
        return systemItem(.undo)
    }

}
