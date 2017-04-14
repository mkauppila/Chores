//
//  ChoreItem.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import Foundation

typealias UniqueId = UInt

struct ChoreItem {
    let id: UniqueId // TODO hash based on name would be more unique than id
    let name: String
    let points: Int
    let completed: Bool
}
