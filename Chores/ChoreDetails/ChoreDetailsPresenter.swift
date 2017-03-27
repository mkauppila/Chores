//
//  ChoreDetailsPresenter.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoreDetailsPresenter {
    var viewController: ChoreDetailsViewController
    var interactor: ChoreDetailsInteractor?
    var navigator: ChoreDetailsNavigator?

    init(viewController: ChoreDetailsViewController) {
        self.viewController = viewController
    }

    func addChoreItem(named: String, points pointsString: String) {
        if let points = Int(pointsString) {
            interactor?.addChoreItem(named: named, points: points)
        } else {
            // TODO:
            // do some error handling, or don't let user to input anything else
            // than integers
        }
    }
}
