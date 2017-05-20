//
//  ChoreDetailsPresenter.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoreDetailsPresenter {
    let viewController: ChoreDetailsViewController
    var interactor: ChoreDetailsInteractor?
    var navigator: ChoreDetailsNavigator?

    init(viewController: ChoreDetailsViewController) {
        self.viewController = viewController
    }
}

extension ChoreDetailsPresenter {
    // MARK: UI Action Handlers

    func addChoreItem(named name: String, points pointsString: String) {
        if let points = Int(pointsString) {
            interactor?.addChoreItem(named: name, points: points)
        } else {
            print("it failed :(")
            // TODO:
            // do some error handling, or don't let user to input anything else
            // than integers
        }
    }
}
