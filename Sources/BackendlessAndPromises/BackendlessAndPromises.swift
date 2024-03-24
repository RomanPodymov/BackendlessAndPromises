//
//  BackendlessAndPromises.swift
//  BackendlessAndPromises
//
//  Created by Roman Podymov on 24/03/2024.
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
                throw NSError()
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
                throw NSError()
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
                throw NSError()
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
                throw NSError()
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
                throw NSError()
            }
            deepSave(entity: entity) {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }
}

public extension UserService {
    func isValidUserToken(on queue: DispatchQueue = .promises) -> Promise<Bool> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            isValidUserToken {
                onSuccess($0)
            } errorHandler: {
                onError($0)
            }
        }
    }

    func login(identity: String, password: String, on queue: DispatchQueue = .promises) -> Promise<BackendlessUser> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            login(
                identity: identity,
                password: password,
                responseHandler: {
                    onSuccess($0)
                }, errorHandler: {
                    onError($0)
                }
            )
        }
    }

    func registerUser(user: BackendlessUser, on queue: DispatchQueue = .promises) -> Promise<BackendlessUser> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            registerUser(
                user: user,
                responseHandler: {
                    onSuccess($0)
                },
                errorHandler: {
                    onError($0)
                }
            )
        }
    }

    func restorePassword(identity: String, on queue: DispatchQueue = .promises) -> Promise<Void> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            restorePassword(
                identity: identity,
                responseHandler: {
                    onSuccess(())
                },
                errorHandler: {
                    onError($0)
                }
            )
        }
    }

    func update(user: BackendlessUser, on queue: DispatchQueue = .promises) -> Promise<BackendlessUser> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            update(
                user: user,
                responseHandler: {
                    onSuccess($0)
                }, errorHandler: {
                    onError($0)
                }
            )
        }
    }

    func logout(on queue: DispatchQueue = .promises) -> Promise<Void> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw NSError()
            }
            logout {
                onSuccess(())
            } errorHandler: { error in
                onError(error)
            }
        }
    }
}
