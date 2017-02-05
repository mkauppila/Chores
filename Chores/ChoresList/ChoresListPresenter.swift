//
//  ChoresListPresenter.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoresListPresenter {
    var viewController: ChoresListViewController? // TODO: needs an interface for better testing support
    var interactor: ChoresListInteractor?
    var navigator: ChoresListNavigator?
}
