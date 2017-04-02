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
    private var choresListNavigator: ChoresListNavigator?

    private let dependencies = Services()

    init(toWindow window: UIWindow) {
        self.window = window
    }

    func installRootViewControllerToWindow() {
        let rootNavigator = RootNavigator(forWindow: window, withServices: dependencies)

        choresListNavigator = ChoresListNavigator(withRootNavigator: rootNavigator)
        choresListNavigator?.presentFrom(window: window)
    }
}
