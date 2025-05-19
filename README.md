# iOS SDK (internal)

## Building binary
- `xcodebuild archive -scheme ScribeUpSDK -configuration Release -destination 'generic/platform=iOS' -archivePath './build/ios.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES`

- `xcodebuild archive -scheme ScribeUpSDK -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath './build/simulator.xcarchive' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES`

- `xcodebuild -create-xcframework -framework './build/ios.xcarchive/Products/Library/Frameworks/ScribeUpSDK.framework' -framework './build/simulator.xcarchive/Products/Library/Frameworks/ScribeUpSDK.framework' -output './ScribeUpSDK.xcframework'`

## Deploying
- Copy `ScribeUpSDK.xcframework` to external SDK repo
- Bump up tag
  - `git tag -a v0.0.X -m "ScribeUpSDK version 0.0.X"`
  - `git push origin 0.0.X`