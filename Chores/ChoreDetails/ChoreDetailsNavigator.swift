//
//  ChoreDetailsNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 12/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoreDetailsNavigator {
    let rootNavigator: RootNavigator

    init(rootNavigator: RootNavigator) {
        self.rootNavigator = rootNavigator
    }

    private func wireUpChoreDetails() -> ChoreDetailsViewController {
        let viewController = ChoreDetailsViewController()

        let presenter = ChoreDetailsPresenter(viewController: viewController)
        let interactor = ChoreDetailsInteractor(withChoreItemStore: rootNavigator.services.choreItemStore)

        viewController.presenter = presenter

        presenter.navigator = self
        presenter.interactor = interactor

        interactor.presenter = presenter

        return viewController
    }

    func presentChoreDetails() {
        rootNavigator.navigateTo(viewController: wireUpChoreDetails(),
                                 withAnimation: true)
    }
}
