// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WayneKit",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "WayneKit",
            targets: ["WayneKit"]),
    ],
    targets: [
        .target(
            name: "WayneKit",
            dependencies: [],
            path: "Sources/WayneKit"),
        .testTarget(
            name: "WayneKitTests",
            dependencies: ["WayneKit"],
            path: "Tests/WayneKitTests"),
    ]
)

