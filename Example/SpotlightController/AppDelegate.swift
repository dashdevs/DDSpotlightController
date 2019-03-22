//
//  AppDelegate.swift
//  SpotlightController
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import UIKit
import SpotlightController
import CoreSpotlight

var Current = Environment()

extension UIStoryboard {
    enum Constants {
        static let main = "Main"
        static let detail = "Detali"
    }
    static func mainStory() -> UIStoryboard {
        return UIStoryboard(name: Constants.main, bundle: nil)
    }
    
    func detailScreen() -> DetailViewController? {
        return instantiateViewController(withIdentifier: Constants.detail) as? DetailViewController
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var spotlight: SpotlightController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "ExampleApp"
        spotlight = SpotlightController(name)
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if let identifier = userActivity.searchItemIdentifier {
            if let vc = UIStoryboard.mainStory().detailScreen() {
                let model = Current.models.first(where: { $0.uniqueIdentifier == identifier })
                vc.model = model
                router.popToRootViewController(animated: false)
                router.show(vc, sender: nil)
            }
        }
        return true
    }
}

extension AppDelegate {
    var router: UINavigationController {
        return window?.rootViewController as! UINavigationController
    }
}

