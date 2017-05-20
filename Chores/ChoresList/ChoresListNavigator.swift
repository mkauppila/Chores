//
//  ChoresListNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListNavigator {
    fileprivate let rootNavigator: RootNavigator

    init(withRootNavigator navigator: RootNavigator) {
        rootNavigator = navigator
    }
}

extension ChoresListNavigator {
    func createChoresList() -> ChoresListViewController {
        let viewController = ChoresListViewController()
        let interactor = ChoresListInteractor(withChoreItemStore: rootNavigator.services.choreItemStore)
        let presenter = ChoresListPresenter(withViewController:viewController)

        interactor.presenter = presenter
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.navigator = self

        return viewController
    }

    func navigateToChoreDetails() {
        let navigator = ChoreDetailsNavigator(withRootNavigator: rootNavigator)
        navigator.presentChoreDetails()
    }
}
