// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Gooey",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Gooey",
            targets: ["Gooey"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Gooey",
            dependencies: [],
            path: "Gooey/Sources"),
        .testTarget(
            name: "GooeyTests",
            dependencies: ["Gooey"],
            path: "GooeyTests",
            exclude: ["Info.plist"]),
    ]
)
