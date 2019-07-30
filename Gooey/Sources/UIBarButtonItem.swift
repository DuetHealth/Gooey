import Foundation
import UIKit

public extension GooeyNamespace where Base == UIBarButtonItem.Type {

    /// The system action button.
    var action: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
    }

    /// The system plus button containing an icon of a plus sign.
    var add: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }

    /// The system bookmarks button.
    var bookmarks: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
    }

    /// The system camera button.
    var camera: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)
    }

    /// The system cancel button, localized.
    var cancel: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    }

    /// The system compose button.
    var compose: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: nil)
    }

    /// The system done button, localized.
    var done: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
    }

    /// The system edit button, localized.
    var edit: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
    }

    /// The system fast forward button.
    var fastForward: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .fastForward, target: nil, action: nil)
    }

    /// Blank space to add between other items. Only the width property is used when this value is set.
    func fixedSpace(_ spacing: CGFloat) -> UIBarButtonItem {
        let item = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        item.width = spacing
        return item
    }

    /// Blank space to add between other items. The space is distributed equally between the other items. Other item properties are ignored when this value is set.
    var flexibleSpace: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }

    /// A button specialized for placement on a toolbar or tab bar.
    var organize: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .organize, target: nil, action: nil)
    }

    /// The system page curl button.
    @available(*, deprecated, message: "UIBarButtonSystemItemPageCurl is not recommended for apps that run in iOS 7 and later.")
    var pageCurl: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .pageCurl, target: nil, action: nil)
    }

    /// The system pause button.
    var pause: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .pause, target: nil, action: nil)
    }

    /// The system play button.
    var play: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .play, target: nil, action: nil)
    }

    /// The system redo button.
    var redo: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .redo, target: nil, action: nil)
    }

    /// The system refresh button.
    var refresh: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
    }

    /// The system reply button.
    var reply: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .reply, target: nil, action: nil)
    }

    /// The system rewind button.
    var rewind: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .rewind, target: nil, action: nil)
    }

    /// The system save button.
    var save: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    }

    /// The system search button.
    var search: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
    }

    /// The system stop button.
    var stop: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    }
    
    /// Blank space to add between other items. The width is calculated as a product of the standard system spacing.
    func systemSpace(multiplier: CGFloat) -> UIBarButtonItem {
        return fixedSpace(CGFloat.goo.systemSpacing * multiplier)
    }

    /// The system trash button.
    var trash: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .trash, target: nil, action: nil)
    }

    /// The system undo button.
    var undo: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .undo, target: nil, action: nil)
    }

}
