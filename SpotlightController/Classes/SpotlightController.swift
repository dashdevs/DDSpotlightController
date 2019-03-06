//
//  SpotlightController.swift
//  SpotlightController
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import Foundation
import CoreSpotlight

//struct Environment {
//    var application: Application
//}
//
//struct Application {
//    var build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
//    var release = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
//}


public final class SpotlightController {
    private let index: CSSearchableIndex
    
    public init?(_ indexName: String) {
        if CSSearchableIndex.isIndexingAvailable() {
            self.index = CSSearchableIndex(name: indexName)
        } else {
            return nil
        }
    }
    
    public func index(_ items: [SearchableItem]) {
        index.indexSearchableItems(items.map({ $0.spotlightItem })) { error in
            print(error ?? "error")
        }
    }
}

public protocol SearchableItem {
    var spotlightItem: CSSearchableItem { get }
    var identifier: String { get }
}
