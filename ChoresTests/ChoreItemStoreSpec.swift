//
// Created by Markus Kauppila on 01/04/17.
// Copyright (c) 2017 Markus Kauppila. All rights reserved.
//


@testable import Chores

import Quick
import Nimble

class ChoreItemStoreSpec: QuickSpec {

    override func spec() {
        xdescribe("ChoreItemStore creation") {
            it("is empty") {
                let choreItemStore = ChoreItemStore()
                expect(choreItemStore.allChoreItems()).to(beEmpty())
            }
        }

        describe("ChoreItemStore items can be manipulated" ) {
            var choreItemStore: ChoreItemStore!
            beforeEach { choreItemStore = ChoreItemStore() }

            it("can handle adding items") {
                let name = "test"
                choreItemStore.addChoreItem(named: name, points: 100)
                expect(choreItemStore.findChoreItem(byName: name)).notTo(be(beNil()))
            }

            it("can returns nil if searching for item that doesn't exit") {
                expect(choreItemStore.findChoreItem(byName: "no")).to(beNil())
            }

            it("is possible to delete added items") {
                let name = "test"
                choreItemStore.addChoreItem(named: name, points: 100)
                let choreItem = choreItemStore.findChoreItem(byName: name)

                expect(choreItemStore.deleteChoreItem(byId: choreItem!.id)).to(beTrue())
            }

            it("is it not possible to delete non-existent items") {
                let item = ChoreItem(id: 0, name: "name", points: 100, completed: false)
                expect(choreItemStore.deleteChoreItem(byId: item.id)).to(beFalse())
            }
        }
    }
}
