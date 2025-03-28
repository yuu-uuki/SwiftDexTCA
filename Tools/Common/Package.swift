// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [
        .macOS(.v15),
    ],
    dependencies: [
        .package(url: "https://github.com/yonaskolb/Mint.git", from: "0.15.0"),
    ],
    targets: [
        .target(name: "Common"),
    ]
)
