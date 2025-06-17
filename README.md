# ScribeUpSDK


### Installation

The ScribeUp iOS SDK is available via [Swift Package Manager](https://swift.org/package-manager/).

Latest Version
```
0.4.2
```

#### Swift Package Manager
Add `https://github.com/ScribeUp/scribeup-sdk-ios` as a package dependency.

#### CocoaPods
To install the SDK with CocoaPods, add `ScribeUpSDK` as one of your target dependencies in your Podfile:

```ruby
use_frameworks!

target 'MyApp' do
    pod 'ScribeUpSDK'
end
```

Please be sure to run `pod update` and use `pod install --repo-update` to ensure you have the most recent version of the SDK installed.


### SubscriptionManagerViewController

`SubscriptionManagerViewController` is a UIViewController subclass that lets you easily integrate the subscription manager into your app. For example, you can present it like this:

```swift
import ScribeUpSDK

let subscriptionVC = SubscriptionManagerViewController(
  url: authenticatedUrl,
  productName: "Bill Navigator",
  delegate: self
)
self.present(subscriptionVC, animated: true)
```

For details on completing authentication and generating a valid URL, please visit [ScribeUp Documentation](https://docs.scribeup.io).

## Implementing SubscriptionManagerDelegate
To receive optional callback events, conform to the SubscriptionManagerDelegate protocol. For example:

### `onExit(_ error: SubscriptionManagerError?)`
This callback is invoked when the user exits the subscription manager—either intentionally or as a result of an error.

## Author

[ScribeUp](https://scribeup.io)

## License
ScribeUpSDK is released under the MIT license. See the LICENSE file for details.
