// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        .package(path: "../Packages/DataStore"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "DataStore", package: "DataStore")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]
        ),
    ]
)
