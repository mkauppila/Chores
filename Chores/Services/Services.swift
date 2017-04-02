//
// Created by Markus Kauppila on 02/04/17.
// Copyright (c) 2017 Markus Kauppila. All rights reserved.
//

import Foundation

// Unified access point for collecting all the services together
class Services {
    let choreItemStore = ChoreItemStore()
    let fileSystem = FileSystem()
}