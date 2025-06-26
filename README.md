# ScribeUpSDK


### Installation

The ScribeUp iOS SDK is available via [Swift Package Manager](https://swift.org/package-manager/) and [CocoaPods](https://cocoapods.org/).

Latest Version
```
0.5.64
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

### SubscriptionManagerViewController

`SubscriptionManagerViewController` is a UIViewController subclass that lets you easily integrate the subscription manager into your app. For example, you can present it like this:

```swift
import ScribeUpSDK

let subscriptionVC = SubscriptionManagerViewController(
  url: authenticatedUrl,
  productName: "Subscription Manager",
  listener: self.subscriptionListener
)
self.present(subscriptionVC, animated: true)
```

- `url`: A fully authenticated URL for managing subscriptions.
  - For details on completing authentication and generating a valid URL, please visit [ScribeUp Documentation](https://docs.scribeup.io).
- `productName` (optional): The name displayed in the navigation bar.
- `listener` (optional): An object conforming to `SubscriptionManagerListener` to receive event callbacks.


## Listener Model
Implement the `SubscriptionManagerListener` protocol to receive optional event callbacks.
```swift
// SubscriptionManagerListener.swift
import Foundation

public protocol SubscriptionManagerListener: AnyObject {
    // Called when the subscription manager flow ends.
    // - Parameter error: `SubscriptionManagerError` if the flow failed or `nil` on success.
    func onExit(_ error: SubscriptionManagerError?)
}
```

Example implementation in your app:
```swift
private class SubscriptionListener: SubscriptionManagerListener {
    func onExit(_ error: SubscriptionManagerError?) {
        print("onExit triggered: \(error?.message ?? "No error")")
    }
}

class ViewController: UIViewController {
  // Usage in your view controller:
  private var subscriptionListener: SubscriptionManagerListener?

  // ...

  @objc private func openSubscriptionManager() {
    // Create and assign the listener
    self.subscriptionListener = SubscriptionListener()

    let subscriptionVC = SubscriptionManagerViewController(
      url: authenticatedUrl,
      productName: "Subscription Manager",
      listener: self.subscriptionListener
    )
    self.present(subscriptionVC, animated: true)
  }
}
```

## Author

[ScribeUp](https://scribeup.io)

## License
ScribeUpSDK is released under the MIT license. See the LICENSE file for details.
