//
//  ChoreDetailsInteractor.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoreDetailsInteractor {
    weak var presenter: ChoreDetailsPresenter?

    private var choreItemStore: ChoreItemStore

    init(withChoreItemStore choreItemStore: ChoreItemStore) {
        self.choreItemStore = choreItemStore
    }

    func addChoreItem(named name: String, points: Int) {
        choreItemStore.addChoreItem(named: name, points: points)
    }
}
