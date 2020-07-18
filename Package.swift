// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtCoderSwift",
    products: [
        .executable(name: "AtCoderSwift", targets: ["AtCoderSwift"]),
        .executable(name: "AtCoderSwiftGenerator", targets: ["AtCoderSwiftGenerator"]),
        .library(name: "Algorithm", targets: ["Algorithm"]),
        .library(name: "Generator", targets: ["Generator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4"),
    ],
    targets: [
        .target(name: "AtCoderSwift", dependencies: ["Algorithm"]),
        .target(name: "Algorithm"),
        .target(name: "AtCoderSwiftGenerator", dependencies: ["Commander", "Generator"]),
        .target(name: "Generator", dependencies: ["SwiftSoup"]),
        .testTarget(name: "AtCoderSwiftTests", dependencies: ["AtCoderSwift"]),
        .testTarget(name: "AlgorithmTests", dependencies: ["Algorithm"]),
        .testTarget(name: "AtCoderSwiftGeneratorTests", dependencies: ["AtCoderSwiftGenerator"]),
        .testTarget(name: "GeneratorTests", dependencies: ["Generator"]),
    ]
)
