import Foundation
import UIKit

public extension GooeyNamespace where Base: UITableView {

    /// Creates a `UIRefreshControl` and adds it to the `UITableView`.
    ///
    /// - Returns: the created refresh control.
    func addRefreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl(frame: .zero)
        if #available(iOS 10.0, *) {
            base.refreshControl = refreshControl
        } else {
            base.addSubview(refreshControl)
        }
        return refreshControl
    }

    /// Begins a series of method calls that insert, delete, or select rows and sections of the table view.
    ///
    /// - Parameters:
    ///   - batchUpdates: The closure that performs the relevant insert, delete, reload, or move operations
    ///   - completion: A completion handler block to execute when all of the operations are finished.
    ///     This block has no return value and takes a Boolean parameter indicating whether the animations
    ///     completed successfully. The value of this parameter is false if the animations were
    ///     interrupted for any reason.
    func update(_ batchUpdates: (() -> ())? = nil, completion: ((Bool) -> ())? = nil) {
        if #available(iOS 11.0, *) {
            base.performBatchUpdates(batchUpdates, completion: completion)
        } else {
            let forcedCompletion: () -> () = { completion?(true) }
            CATransaction.begin()
            CATransaction.setCompletionBlock(forcedCompletion)
            base.beginUpdates()
            batchUpdates?()
            base.endUpdates()
            CATransaction.commit()
        }
    }

    /// Returns the last numerical row in the table view's section or nil if no rows exist in that section.
    ///
    /// - Parameter section: the numerical section in the table view.
    /// - Returns: the last numerical row in the table view's section or nil
    func lastRow(inSection section: Int) -> Int? {
        return base.numberOfRows(inSection: section) > 0 ? base.numberOfRows(inSection: section) - 1 : nil
    }

}

