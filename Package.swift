// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ScribeUpSDK",
    platforms: [ .iOS(.v13) ],
    products: [
        .library(
            name: "ScribeUpSDK",
            type: .dynamic,
            targets: ["ScribeUpSDK"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ScribeUpSDK",
            path: "ScribeUpSDK",
            resources: [
                .process("Assets.xcassets")
            ]
        ),
    ]
)
