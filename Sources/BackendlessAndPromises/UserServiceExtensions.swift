//
//  UserServiceExtensions.swift
//  BackendlessAndPromises
//
//  Created by Roman Podymov on 01/04/2024.
//  Copyright © 2024 BackendlessAndPromises. All rights reserved.
//

import Dispatch
import Foundation
import Promises
import SwiftSDK

public extension UserService {
    func isValidUserToken(on queue: DispatchQueue = .promises) -> Promise<Bool> {
        .init(on: queue) { [weak self] onSuccess, onError in
            guard let self else {
                throw BackendlessAndPromisesError.nilSelf
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
                throw BackendlessAndPromisesError.nilSelf
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
                throw BackendlessAndPromisesError.nilSelf
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
                throw BackendlessAndPromisesError.nilSelf
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
                throw BackendlessAndPromisesError.nilSelf
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
                throw BackendlessAndPromisesError.nilSelf
            }
            logout {
                onSuccess(())
            } errorHandler: { error in
                onError(error)
            }
        }
    }
}
