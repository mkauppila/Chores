//
//  ChoreDetailsNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 12/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoreDetailsNavigator {
    fileprivate let rootNavigator: RootNavigator

    init(withRootNavigator rootNavigator: RootNavigator) {
        self.rootNavigator = rootNavigator
    }
}

extension ChoreDetailsNavigator {
    private func createChoreDetails() -> ChoreDetailsViewController {
        let viewController = ChoreDetailsViewController()
        let presenter = ChoreDetailsPresenter(viewController: viewController)
        let interactor = ChoreDetailsInteractor(withChoreItemStore: rootNavigator.services.choreItemStore)

        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.navigator = self
        presenter.interactor = interactor

        return viewController
    }

    func presentChoreDetails() {
        rootNavigator.navigateTo(viewController: createChoreDetails(),
                                 withAnimation: true)
    }
}
