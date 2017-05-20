//
// Created by Markus Kauppila on 02/04/17.
// Copyright (c) 2017 Markus Kauppila. All rights reserved.
//

import Foundation

protocol Serialization {
    func saveToDisk()
    func restoreFromDisk()
}

class FileSystem {
}

private extension FileSystem {
    func createFileURL(filename: String) -> String {
       return filename
    }
}