//
//  AppDependencies.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit


class AppDependencies {
    private let window: UIWindow
    private let services = Services()

    init(toWindow window: UIWindow) {
        self.window = window
    }

    func createAndShowInitialViewController() {
        let rootNavigator = RootNavigator(forWindow: window, withServices: services)
        let choresListNavigator = ChoresListNavigator(withRootNavigator: rootNavigator)
        rootNavigator.showInitial(viewController: choresListNavigator.createChoresList())
    }
}
