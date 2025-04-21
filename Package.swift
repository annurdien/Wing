// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Wing",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(name: "Wing", targets: ["Wing"]),
    .library(name: "Wing-Dynamic", type: .dynamic, targets: ["Wing"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0")
  ],
  targets: [
    .target(name: "Wing", path: "Sources"),
    .testTarget(name: "WingTests", dependencies: ["Wing"]),
  ],
  swiftLanguageModes: [
    .v6
  ]
)
