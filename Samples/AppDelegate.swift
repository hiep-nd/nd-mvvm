//
//  AppDelegate.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 11/9/20.
//

import UIKit
import NDModificationOperators

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window

    window.rootViewController = UINavigationController(rootViewController: MenuViewController())
    window.makeKeyAndVisible()
    return true
  }
}
