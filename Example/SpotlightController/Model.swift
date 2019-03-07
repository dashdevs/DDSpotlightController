//
//  Model.swift
//  SpotlightController_Example
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import SpotlightController
import CoreSpotlight
import MobileCoreServices

struct AppModel {
    var title: String
    var content: String
    var number: Int
}

extension AppModel: SearchableItem {
    var attributeSet: CSSearchableItemAttributeSet {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.keywords = ["model", "application", "search"]
        attributeSet.displayName = "Plain search Model" + title
        attributeSet.title = title
        attributeSet.contentDescription = content
        return attributeSet
    }
    
    var uniqueIdentifier: String {
        return String(number)
    }
}

extension Array where Element == AppModel {
    static func mocks(_ count: Int) -> Array {
        return (1...count).map({ idx in
            return AppModel(title: "title \(idx)", content: "content content content \(idx)", number: idx)
        })
    }
}
