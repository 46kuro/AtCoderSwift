// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtCoderSwift",
    products: [
        .executable(name: "AtCoderSwift", targets: ["AtCoderSwift"]),
        .library(name: "Algorithm", targets: ["Algorithm"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AtCoderSwift", dependencies: ["Algorithm"]),
        .target(name: "Algorithm"),
        .testTarget(name: "AtCoderSwiftTests", dependencies: ["AtCoderSwift"]),
        .testTarget(name: "AlgorithmTests", dependencies: ["Algorithm"]),
    ]
)
