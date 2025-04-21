// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Wing",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8),
    ],
  products: [
    .library(name: "Wing", targets: ["Wing"]),
    .library(name: "Wing-Dynamic", type: .dynamic, targets: ["Wing"]),
  ],
  targets: [
    .target(name: "Wing", path: "Sources"),
    .testTarget(name: "WingTests", dependencies: ["Wing"]),
  ],
  swiftLanguageModes: [
    .v6
  ]
)
