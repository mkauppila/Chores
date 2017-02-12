//
//  AppDelegate.swift
//  Chores
//
//  Created by Markus Kauppila on 26/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class AppDependencies {
    private let window: UIWindow
    private var choresListNavigator: ChoresListNavigator?

    init(toWindow window: UIWindow) {
        self.window = window
    }

    func installRootViewControllerToWindow() {
        choresListNavigator?.presentFrom(window: window)
    }

    func createDependencies() {
        let rootNavigator = RootNavigator(forWindow: window)

        choresListNavigator = ChoresListNavigator()
        choresListNavigator?.rootNavigator = rootNavigator

        // TODO: Make sure to break the circular references
        let choresListInteractor = ChoresListInteractor()
        let choresListPresenter = ChoresListPresenter()

        choresListPresenter.interactor = choresListInteractor
        choresListPresenter.navigator = choresListNavigator

        choresListInteractor.output = choresListPresenter
        choresListNavigator?.presenter = choresListPresenter
    }
}

// Creates the root navigator for all the other navigators
class RootNavigator {
    private let window: UIWindow

    init(forWindow window: UIWindow) {
        self.window = window
    }

    // Show the initial view controller
    func showRoot(viewController controller: UIViewController) {
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func navigationControllerFrom(window: UIWindow) -> UINavigationController? {
        return window.rootViewController as? UINavigationController
    }

    // MARK: Navigation Support

    func navigateTo(viewController: UIViewController, withAnimation animation: Bool) {
        if let navController = navigationControllerFrom(window: window) {
            navController.pushViewController(viewController, animated: animation)
        }
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencies: AppDependencies!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        if let window = window {
            dependencies = AppDependencies(toWindow: window)
            dependencies.createDependencies()
            dependencies.installRootViewControllerToWindow()
        }

        return true
    }
}

