//
//  ChoresListInteractor.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

struct ChoreItem {
    // TODO: needs and id?
    let name: String
    let points: Int
    let completed: Bool
}

class ChoresListInteractor {
    weak var output: ChoresListPresenter?

    private var choreItems = [
        ChoreItem(name: "Reorganize kitchen cabinets", points: 150, completed: false),
        ChoreItem(name: "Clean up bathroom sink's stench trap ", points: 500, completed: false),
    ]

    func allChoreItems() -> [ChoreItem] {
        return choreItems
    }
}



