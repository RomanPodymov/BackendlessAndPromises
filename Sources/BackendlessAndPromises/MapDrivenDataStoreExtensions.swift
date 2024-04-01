//
//  MapDrivenDataStoreExtensions.swift
//  BackendlessAndPromises
//
//  Created by Roman Podymov on 01/04/2024.
//  Copyright © 2024 BackendlessAndPromises. All rights reserved.
//

import Dispatch
import Foundation
import Promises
import SwiftSDK

public extension MapDrivenDataStore {
    func removeById(objectId: String, on queue: DispatchQueue = .promises) -> Promise<Int> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            removeById(objectId: objectId) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func getObjectCount(on queue: DispatchQueue = .promises) -> Promise<Int> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            getObjectCount {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func getObjectCount(queryBuilder: DataQueryBuilder, on queue: DispatchQueue = .promises) -> Promise<Int> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            getObjectCount(queryBuilder: queryBuilder) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func find(queryBuilder: DataQueryBuilder, on queue: DispatchQueue = .promises) -> Promise<[[String: Any]]> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            find(queryBuilder: queryBuilder) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func deepSave(entity: [String: Any], on queue: DispatchQueue = .promises) -> Promise<[String: Any]> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            deepSave(entity: entity) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func addRelation(
        columnName: String,
        parentObjectId: String,
        childrenObjectIds: [String],
        on queue: DispatchQueue = .promises
    ) -> Promise<Int> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
            }
            addRelation(columnName: columnName, parentObjectId: parentObjectId, childrenObjectIds: childrenObjectIds) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }
}
