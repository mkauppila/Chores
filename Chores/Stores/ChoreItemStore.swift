//
// Created by Markus Kauppila on 27/03/17.
// Copyright (c) 2017 Markus Kauppila. All rights reserved.
//

import Foundation

typealias UniqueId = UInt

protocol Serialization {
    func saveToDisk()
    func restoreFromDisk()
}

class ChoreItemStore {
    var choreItems: [ChoreItem] = []

    init() {
        choreItems = createDefaultChoreItems()
    }

    func addChoreItem(named name: String, points: Int) {
        choreItems.append(createNewChoreItem(named: name, points: points))
        print("chore items: \(choreItems)")
    }

    func allChoreItems() -> [ChoreItem] {
        print("chore items: \(choreItems)")
        return choreItems
    }
}

extension ChoreItemStore: Serialization {
    var fileName: String {
        get { return "hello" }
    }

    func saveToDisk() {
    }

    func restoreFromDisk() {
    }
}

fileprivate extension ChoreItemStore {
    func createDefaultChoreItems() -> [ChoreItem] {
        return [
            ChoreItem(id: 1, name: "Reorganize kitchen cabinets", points: 150, completed: false),
            ChoreItem(id: 2, name: "Clean up bathroom sink's stench trap ", points: 500, completed: false),
        ]
    }

    func createNewChoreItem(named name: String, points: Int) -> ChoreItem {
        return ChoreItem(id: nextUniqueId(choreItems: self.choreItems),
                         name: name,
                         points: points,
                         completed: false)
    }

    func nextUniqueId(choreItems: [ChoreItem]) -> UniqueId {
        var id: UniqueId = 0
        for item in choreItems {
            if item.id > id {
                id = item.id
            }
        }
        return id + 1
    }
}

