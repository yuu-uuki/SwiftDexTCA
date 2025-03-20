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
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.8.1")
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "DataStore", package: "DataStore"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]
        ),
    ]
)
