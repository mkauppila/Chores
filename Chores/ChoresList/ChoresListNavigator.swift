//
//  ChoresListNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListNavigator {
    var rootNavigator: RootNavigator?
    var presenter: ChoresListPresenter?

    func presentFrom(window: UIWindow) {
        let viewController = ChoresListViewController()
        viewController.presenter = presenter
        presenter?.viewController = viewController
        rootNavigator?.showRoot(viewController: viewController, inWindow: window)
    }
}
