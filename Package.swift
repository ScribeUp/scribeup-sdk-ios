// swift-tools-version:5.3
 import PackageDescription

 let package = Package(
     name: "ScribeUpSDK",
     platforms: [.iOS(.v13)],
     products: [
         .library(
             name: "ScribeUpSDK",
             targets: ["ScribeUpSDK"]
         ),
     ],
     targets: [
        .binaryTarget(
          name: "ScribeUpSDK",
          path: "./Sources/ScribeUpSDK/spm/ScribeUpSDK.xcframework"
        ),
     ]
 )
