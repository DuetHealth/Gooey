import Foundation
import UIKit

@inline(__always) fileprivate func fullyQualifiedName(of type: AnyClass) -> String {
    let bundle = Bundle(for: type).bundleIdentifier ?? Bundle.main.bundleIdentifier!
    return "\(bundle).\(String(describing: type))"
}

public extension GooeyNamespace where Base: UITableView {

    /// Registers a number of classes for use in creating new table cells.
    ///
    /// - Parameter cells: The classes of cells that you want to use in the table.
    func register(cells: AnyClass...) {
        cells.map { type in (type, fullyQualifiedName(of: type)) }
            .forEach(base.register(_:forCellReuseIdentifier:))
    }

    /// Registers a cell for use in creating new table cells.
    ///
    /// - Parameter cell: The `UITableViewCell` subclass to register with the table.
    func register<Cell: UITableViewCell>(cell: Cell.Type) {
        base.register(cell, forCellReuseIdentifier: fullyQualifiedName(of: cell))
    }

    /// Registers a header/footer view for use in creating new section views.
    ///
    /// - Parameter view: The `UITableViewHeaderFooterView` subclass to register with the table.
    func register<View: UITableViewHeaderFooterView>(view: View.Type) {
        base.register(view, forHeaderFooterViewReuseIdentifier: fullyQualifiedName(of: view))
    }

    /// Returns a reusable table view cell of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `register(cells:)`, otherwise
    /// this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// tableView.goo.register(cells: MobilePhoneCell.self, EmailCell.self, WebsiteCell.self)
    /// ...
    ///
    /// // In tableView(_: cellForRowAt:)
    /// ...
    /// let cell: EmailCell = tableView.goo.dequeueReusableCell(at: indexPath)
    /// cell.emailCellBehavior()
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    func dequeueReusableCell<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell {
        return base.dequeueReusableCell(withIdentifier: fullyQualifiedName(of: Cell.self), for: indexPath) as! Cell
    }

    /// Returns a reusable header/footer view of the specified type.
    ///
    /// You must register the specialized type `View` by invoking `register(view:)`, otherwise
    /// this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// tableView.goo.register(view: WarningHeader.self)
    /// ...
    ///
    /// // In tableView(_: viewForHeaderInSection:)
    /// ...
    /// let header: WarningHeader = tableView.goo.dequeueReusableView()
    /// header.showWarning()
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    func dequeueReusableView<View: UITableViewHeaderFooterView>() -> View {
        return base.dequeueReusableHeaderFooterView(withIdentifier: fullyQualifiedName(of: View.self)) as! View
    }

}

public extension GooeyNamespace where Base: UICollectionView {

    /// Registers a number of classes for use in creating new collection cells.
    ///
    /// - Parameter cells: The classes of cells that you want to use in the collection view.
    func register(cells: AnyClass...) {
        cells.map { type in (type, fullyQualifiedName(of: type)) }
            .forEach(base.register(_:forCellWithReuseIdentifier:))
    }

    /// Registers a cell for use in creating new collection cells.
    ///
    /// - Parameter cell: The UICollectionViewCell subclass to register with the collection view.
    func register<Cell: UICollectionViewCell>(cell: Cell.Type) {
        base.register(cell, forCellWithReuseIdentifier: fullyQualifiedName(of: cell))
    }

    /// Registers a class for use in creating new collection view supplementary views.
    ///
    /// - Parameters:
    ///   - supplement: The class of view that you want to use in the collection view.
    ///   - kind: The kind of supplementary view with which the collection view should associate the class.
    func register(supplement: AnyClass, kind: String) {
        base.register(supplement, forSupplementaryViewOfKind: kind, withReuseIdentifier: fullyQualifiedName(of: supplement))
    }

    /// Returns a reusable collection view cell of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `register(cells:)`, otherwise
    /// this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// collectionView.goo.register(MobilePhoneCell.self, EmailCell.self, WebsiteCell.self)
    /// ...
    ///
    /// // In collectionView(_: cellForRowAt:)
    /// ...
    /// let cell: PictureCell = collectionView.goo.dequeueReusableCell(at: indexPath)
    /// cell.setLikeCounter(to: 5)
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    func dequeueReusableCell<Cell: UICollectionViewCell>(at indexPath: IndexPath) -> Cell {
        return base.dequeueReusableCell(withReuseIdentifier: fullyQualifiedName(of: Cell.self), for: indexPath) as! Cell
    }

    /// Returns a reusable supplementary view of the specified type.
    ///
    /// You must register the specialized type `Cell` by invoking `register(supplement:kind:)`,
    /// otherwise this method will raise an error as the internal reuse identifiers will not match.
    ///
    /// Example:
    ///
    /// ```
    /// // In init(...), loadView(), or viewDidLoad()
    /// ...
    /// collectionView.goo.register(cells: PictureCell.self, StatusCell.self)
    /// ...
    ///
    /// // In collectionView(_: cellForRowAt:)
    /// ...
    /// let cell: PictureCell = collectionView.goo.dequeueReusableCell(at: indexPath)
    /// cell.setLikeCounter(to: 5)
    /// ...
    /// ```
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reused `Cell`. This method always returns a valid cell.
    func dequeueSupplementaryView<View: UICollectionReusableView>(kind: String, at indexPath: IndexPath) -> View {
        return base.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: fullyQualifiedName(of: View.self), for: indexPath) as! View
    }

}
