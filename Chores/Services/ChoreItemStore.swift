//
// Created by Markus Kauppila on 27/03/17.
// Copyright (c) 2017 Markus Kauppila. All rights reserved.
//

import Foundation

class ChoreItemStore {
    var choreItems: [ChoreItem] = []

    init() {
        choreItems = createDefaultChoreItems()
    }

    func addChoreItem(named name: String, points: Int) {
        choreItems.append(createNewChoreItem(named: name, points: points))
        print("chore items: \(choreItems)")
    }

    func findChoreItem(byName name: String) -> ChoreItem? {
        let byName = choreItems.filter { $0.name == name }
        if byName.count > 1 {
            // log a soft error?
            return nil
        }
        return byName.first
    }

    func deleteChoreItem(byId id: UniqueId) -> Bool {
        guard let index = choreItems.index(where: { $0.id == id}) else {
            return false
        }

        choreItems.remove(at: index)
        return true
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
        let fs = FileSystem()

        fs.saveToDisk(data: nil , atPath: "here it goes")

        // fileSystem.saveToDisk(choreItems, usingFileName: fileName)
        // fileSystem.saveToDisk(choreItems, forServices: ChoreItemService.self) won't work if there's multiple different stores
    }

    func restoreFromDisk() {
        // choreItems = fileSystem.restoreFromDisk(usingFileName: fileName)
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

