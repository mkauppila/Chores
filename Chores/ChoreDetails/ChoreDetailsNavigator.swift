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

    private func viewController() -> UIViewController {
//        let viewController = ChoreDetailsViewController(presenter: ChoreDetailsPresenter())
//        return viewController
        return UIViewController()
    }

    func presentChoreDetails() {
        rootNavigator.navigateTo(viewController: viewController(), withAnimation: true)
    }
}
