//
//  AppDelegate.swift
//  SpotlightController
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import UIKit
import SpotlightController
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var spotlight: SpotlightController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
        spotlight = SpotlightController(name)
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if let identifier = userActivity.searchItemIdentifier {
            let model = Current.models.first(where: { $0.uniqueIdentifier == identifier })
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            vc.model = model
            router.popToRootViewController(animated: false)
            router.show(vc, sender: nil)
        }
        return true
    }
}

extension AppDelegate {
    var router: UINavigationController {
        return window?.rootViewController as! UINavigationController
    }
}

