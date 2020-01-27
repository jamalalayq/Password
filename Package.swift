// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Password",

    platforms: [
        .iOS(.v10)
    ],

    products: [
        .library(
            name: "Password",
            targets: ["Password"]),
    ],

    targets: [
        .target(
            name: "Password",
            path: "Sources"
        ),
        .testTarget(
            name: "PasswordTests",
            dependencies: ["Password"]
        ),
    ],
    
    swiftLanguageVersions: [.v5]
)
