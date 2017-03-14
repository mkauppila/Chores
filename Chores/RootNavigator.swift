//
//  RootNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class RootNavigator {
    private let window: UIWindow

    init(forWindow window: UIWindow) {
        self.window = window
    }

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
