//
//  ChoreDetailsNavigator.swift
//  Chores
//
//  Created by Markus Kauppila on 12/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoreDetailNavigator {
    let rootNavigator: RootNavigator?

    init(rootNavigator: RootNavigator) {
        self.rootNavigator = rootNavigator
    }

    private func viewController() -> UIViewController {
        let viewController = ChoresListViewController()
        return viewController
//        viewController.presenter = presenter
//        presenter?.viewController = viewController
//        rootNavigator?.showRoot(viewController: viewController, inWindow: window)
    }

    func presentChoreDetails() {

        rootNavigator?.navigateTo(viewController: viewController(), withAnimation: true)

//        let navigationController = rootNavigator?.defaultNavigationController()
//        navigationController?.pushViewController(viewController(), animated: true)
        // Create the view controller and all that shit!
        // view controller needs to have reference to the navigation controller
    }
}
