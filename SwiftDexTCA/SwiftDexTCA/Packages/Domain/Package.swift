// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        )
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
            ],
            path: "Sources",
            plugins: [
                .plugin(name: "RunMockolo")
            ]
        ),
        .plugin(
            name: "RunMockolo",
            capability: .buildTool(),
            dependencies: [.target(name: "mockolo")]
        ),
        .binaryTarget(
            name: "mockolo",
            url: "https://github.com/uber/mockolo/releases/download/2.3.1/mockolo-macos.artifactbundle.zip",
            checksum: "daefaebdb24bf0f0a5f830523330b81850e9e95a3e2fc2011a50054309a55eae"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]
        )
    ]
)
