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
