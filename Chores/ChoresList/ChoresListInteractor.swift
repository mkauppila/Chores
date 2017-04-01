//
//  ChoresListInteractor.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListInteractor {
    weak var presenter: ChoresListPresenter?

    private let choreItemStore: ChoreItemStore

    init(withChoreItemStore choreItemStore: ChoreItemStore) {
        self.choreItemStore = choreItemStore
    }

    func allChoreItems() -> [ChoreItem] {
        return choreItemStore.allChoreItems()
    }
}



