//
//  AppDelegate.swift
//  Chores
//
//  Created by Markus Kauppila on 26/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

// 

class ChoresListNavigator {
    var rootNavigator: RootNavigator?

    func presentFrom(window: UIWindow) {
        let vc = ViewController()
        rootNavigator?.showRoot(viewController: vc, inWindow: window)
    }
}

//

class AppDependencies {

    private var choresListNavigator: ChoresListNavigator?

    func installRootViewControllerTo(window: UIWindow) {
        // use the navigator of the first class
        // choresListNavigator.presentFromWindow(window)
        choresListNavigator?.presentFrom(window: window)
    }

    func createDependencies() {
        let rootNavigator = RootNavigator()

        choresListNavigator = ChoresListNavigator()
        choresListNavigator?.rootNavigator = rootNavigator
    }
}

// Creates the root navigator for all the other navigators
class RootNavigator {
    func showRoot(viewController controller: UIViewController, inWindow window: UIWindow) {
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func navigationControllerFrom(window: UIWindow) -> UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencies: AppDependencies!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()

        if let window = window {
            dependencies = AppDependencies()
            dependencies.createDependencies()
            dependencies.installRootViewControllerTo(window: window)
        }

        return true
    }
}

