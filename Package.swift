// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Gooey",
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
            path: "Gooey"),
    ]
)
