// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeepLAPI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DeepLAPI",
            targets: ["DeepLAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hackenbacker/WebClient", from: Version(0,1,0)),
        .package(url: "https://github.com/hackenbacker/URLStringBuilder", from: Version(0,1,0))
    ],
    targets: [
        .target(
            name: "DeepLAPI",
            dependencies: [
                .product(name: "WebClient", package: "WebClient"),
                .product(name: "URLStringBuilder", package: "URLStringBuilder")
            ]
        ),
        .testTarget(
            name: "DeepLAPITests",
            dependencies: ["DeepLAPI"],
            resources: [
                .process("./DeepL-API.plist")
            ]
        ),
    ]
)
