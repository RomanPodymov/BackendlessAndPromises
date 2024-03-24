//
//  BackendlessAndPromisesTests.swift
//  BackendlessAndPromisesTests
//
//  Created by Roman Podymov on 24/03/2024.
//  Copyright © 2024 BackendlessAndPromises. All rights reserved.
//

import XCTest
import SwiftSDK
import BackendlessAndPromises

final class BackendlessAndPromisesTests: XCTestCase {
    func testIsValidUserToken() {
        let expectation = expectation(description: "")

        Backendless.shared.userService.isValidUserToken(on: .main).always {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }

    func testLogin() {
        let expectation = expectation(description: "")

        Backendless.shared.userService.login(identity: "", password: "", on: .main).always {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }
}
