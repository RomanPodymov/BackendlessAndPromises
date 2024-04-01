// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BackendlessAndPromises",
    products: [
        .library(
            name: "BackendlessAndPromises",
            targets: ["BackendlessAndPromises"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.3.1"),
        .package(url: "https://github.com/RomanPodymov/Swift-SDK.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "BackendlessAndPromises",
            dependencies: [
                .product(name: "Promises", package: "promises"),
                .product(name: "Backendless", package: "Swift-SDK")
            ]
        ),
        .testTarget(
            name: "BackendlessAndPromisesTests",
            dependencies: [
                .target(name: "BackendlessAndPromises")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
