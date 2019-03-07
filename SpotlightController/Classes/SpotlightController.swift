//
//  SpotlightController.swift
//  SpotlightController
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import Foundation
import CoreSpotlight

public final class SpotlightController: NSObject {
    private let index: CSSearchableIndex
    
    /// Initialises controller and index. If device does not support indexing initialisation fails
    ///
    /// - Parameter indexName: Name for the index instance
    public init?(_ indexName: String) {
        if CSSearchableIndex.isIndexingAvailable() {
            self.index = CSSearchableIndex(name: indexName)
        } else {
            return nil
        }
    }
    
    /// Adds array of instances that conform to SearchableItem to index
    ///
    /// - Parameter items: Array of instances to index
    public func index(_ items: [SearchableItem]) {
        index.indexSearchableItems(items.map({ $0.item })) { error in
            print(error.errorInfo())
        }
    }
    
    /// Removes array instances that conform to SearchableItem from index
    ///
    /// - Parameter items: Array of instances to deindex
    public func deindex(_ items: [SearchableItem]) {
        index.deleteSearchableItems(withIdentifiers: items.map({ $0.uniqueIdentifier })) { error in
            print(error.errorInfo())
        }
    }
    
    /// Removes all indexed instances that conform to SearchableItem
    public func deindexAll() {
        index.deleteAllSearchableItems { (error) in
            print(error.errorInfo())
        }
    }
}

extension Optional where Wrapped == Error {
    func errorInfo() -> String {
        guard let value = self else {
            return NSLocalizedString("No error", comment: "")
        }
        return value.localizedDescription
    }
}

/// Protocol for converting application data to CoreSpotlight instances
public protocol SearchableItem {
    var attributeSet: CSSearchableItemAttributeSet { get }
    var uniqueIdentifier: String { get }
    var domainIdentifier: String? { get }
}

public extension SearchableItem {
    var domainIdentifier: String? {
        return nil
    }
    
    var item: CSSearchableItem {
        return CSSearchableItem(uniqueIdentifier: uniqueIdentifier, domainIdentifier: domainIdentifier, attributeSet: attributeSet)
    }
}

// MARK: - Convenience NSUserActivity extension to get searched item identifier when coming from on-device search
public extension NSUserActivity {
    var searchItemIdentifier: String? {
        if activityType == CSSearchableItemActionType, let info = userInfo {
            return info[CSSearchableItemActivityIdentifier] as? String
        }
        return nil
    }
}
