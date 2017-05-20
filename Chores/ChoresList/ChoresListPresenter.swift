//
//  ChoresListPresenter.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoresListPresenter {
    var viewController: ChoresListViewController
    var interactor: ChoresListInteractor?
    var navigator: ChoresListNavigator?

    init(withViewController viewController: ChoresListViewController) {
        self.viewController = viewController
    }
}

extension ChoresListPresenter {
    // MARK: Data Queries

    func itemAtIndexPath(indexPath: IndexPath) -> ChoreItem? {
        if let items = interactor?.allChoreItems(),
           indexPath.row < items.count {
            return items[indexPath.row]
        } else {
            return nil
        }
    }

    func numberOfItems() -> Int {
        return interactor?.allChoreItems().count ?? 0
    }
}

extension ChoresListPresenter {
    // MARK: UI Action Handlers

    func onOpenAddChoreView() {
        navigator?.navigateToChoreDetails()
    }

    func onMarkChoreItemCompleted() {

    }

    func onOpenChoreDetailsView() {

    }
}
