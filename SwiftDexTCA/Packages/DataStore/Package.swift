// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "DataStore",
            targets: ["DataStore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.7.1"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.8.1"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.0.2"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.8.1")
    ],
    targets: [
        .target(
            name: "DataStore",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Sources",
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
            ]
        ),
        .testTarget(
            name: "DataStoreTests",
            dependencies: ["DataStore"]
        ),
    ]
)
