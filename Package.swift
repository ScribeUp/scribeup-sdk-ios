// swift-tools-version:5.3
 import PackageDescription

 let package = Package(
     name: "ScribeUpSDK",
     products: [
         .library(
             name: "ScribeUpSDK",
             targets: ["ScribeUpSDK"]
         ),
     ],
     dependencies: [
     ],
     targets: [
        .binaryTarget(
          name: "ScribeUpSDK",
          path: "./Sources/ScribeUpSDK/ScribeUpSDK.xcframework"
        ),
     ]
 )
