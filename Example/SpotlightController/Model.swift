//
//  Model.swift
//  SpotlightController_Example
//
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SpotlightController
import CoreSpotlight

struct AppModel {
    var title: String
    var content: String
}

extension AppModel: SearchableItem {
    var spotlightItem: CSSearchableItem {
        let set = CSSearchableItemAttributeSet(itemContentType: <#T##String#>)
        return CSSearchableItem(uniqueIdentifier: <#T##String?#>, domainIdentifier: <#T##String?#>, attributeSet: <#T##CSSearchableItemAttributeSet#>)
    }

    var identifier: String {
        <#code#>
    }


}
