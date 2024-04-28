//
//  FileServiceExtensions.swift
//  BackendlessAndPromises
//
//  Created by Roman Podymov on 28/04/2024.
//  Copyright © 2024 BackendlessAndPromises. All rights reserved.
//

import Dispatch
import Foundation
import Promises
import SwiftSDK

public extension FileService {
    func uploadFile(
        fileName: String,
        filePath: String,
        content: Data,
        overwrite: Bool,
        on queue: DispatchQueue = .promises
    ) -> Promise<BackendlessFile> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            uploadFile(
                fileName: fileName,
                filePath: filePath,
                content: content,
                overwrite: overwrite
            ) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }
}
