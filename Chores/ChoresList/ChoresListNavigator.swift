//
//  ChoresListNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListNavigator {
    let rootNavigator: RootNavigator

    init(withRootNavigator navigator: RootNavigator) {
        rootNavigator = navigator
    }

    func presentFrom(window: UIWindow) {
        let viewController = createChoresList()
        rootNavigator.showRoot(viewController: viewController)
    }

    private func createChoresList() -> ChoresListViewController {
        let choresListInteractor = ChoresListInteractor()
        let choresListPresenter = ChoresListPresenter()
        let viewController = ChoresListViewController()

        choresListInteractor.presenter = choresListPresenter

        viewController.presenter = choresListPresenter

        choresListPresenter.viewController = viewController
        choresListPresenter.interactor = choresListInteractor
        choresListPresenter.navigator = self

        return viewController
    }

    func navigateToChoreDetails() {
        let navigator = ChoreDetailsNavigator(rootNavigator: rootNavigator)
        navigator.presentChoreDetails()
    }
}
