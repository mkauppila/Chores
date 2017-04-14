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
    private let fileManager: FileManager!

    // TODO: Should `FileManager` be accessed through custom Protocol. Would make mocking
    // for testing easier
    init(fileManager: FileManager = FileManager.default) {
        self.fileManager = fileManager
    }

    // TODO should this return boolean of the file path on success/failure. String? or Bool
    func saveToDisk(data: Any, atPath path: String) {
//        let archiver =
        let a: Data!

//        fileManager.createFile(atPath: <#T##String##Swift.String#>, contents: <#T##Data?##Foundation.Data?#>, attributes: <#T##[String: Any]?##[Swift.String: Any]?#>)
        if fileManager.createFile(atPath: path, contents: data) {
            print("Storing data to path \(path) failed")
        }
    }
}

private extension FileSystem {
    func createFileURL(filename: String) -> String {
       return filename
    }
}