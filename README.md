# ScribeUpSDK


### Installation

The ScribeUp iOS SDK is available via [Swift Package Manager](https://swift.org/package-manager/) and [CocoaPods](https://cocoapods.org/).

Latest Version
```
0.8.91
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

### Integration Options

The ScribeUp SDK provides two ways to integrate subscription management into your app:

1. **Modal Presentation** - Using `SubscriptionManagerViewController`
2. **Embedded Widget** - Using `SubscriptionManagerWidgetView`

#### SubscriptionManagerViewController

`SubscriptionManagerViewController` is a UIViewController subclass that lets you easily integrate the subscription manager as a modal presentation. For example, you can present it like this:

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

#### SubscriptionManagerWidgetView

`SubscriptionManagerWidgetView` is a UIView subclass that allows you to embed the subscription manager directly into your existing view hierarchy. This is useful when you want to display subscription management as part of your app's UI rather than as a modal.

```swift
import ScribeUpSDK

// Create and configure the widget view
let widgetView = SubscriptionManagerWidgetView(url: authenticatedUrl)
widgetView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(widgetView)

// Set up Auto Layout constraints
NSLayoutConstraint.activate([
    widgetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
    widgetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    widgetView.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 20),
    widgetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
])
```

**Parameters:**
- `url`: A fully authenticated URL for managing subscriptions (same as ViewController)

**Widget Management:**
```swift
// Show/hide the widget
widgetView.isHidden = false // or true

// Remove the widget completely
widgetView.removeFromSuperview()
```


## Listener Model
Implement the `SubscriptionManagerListener` protocol to receive optional event callbacks.
```swift
// SubscriptionManagerListener.swift
import Foundation

public protocol SubscriptionManagerListener: AnyObject {
    // Called when the subscription manager flow ends.
    // - Parameters:
    //   - error: `SubscriptionManagerError` if the flow failed or `nil` on success.
    //   - data: Optional JSON object with additional data.
    func onExit(_ error: SubscriptionManagerError?, _ data: [String: Any]?)

    // Called when the subscription manager emits an event.
    // - Parameter data: JSON object representing the event payload.
    func onEvent(_ data: [String: Any])
}

public extension SubscriptionManagerListener {
    func onExit(_ error: SubscriptionManagerError?, _ data: [String: Any]?) {}
    func onEvent(_ data: [String: Any]) {}
}
```

Example implementation in your app:
```swift
private class SubscriptionListener: SubscriptionManagerListener {
    func onExit(_ error: SubscriptionManagerError?, _ data: [String: Any]?) {
        let errorDescription = error.map { "code: \($0.code), message: \($0.message)" } ?? "No error"
        let dataDescription = (data.flatMap { try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted) })
            .flatMap { String(data: $0, encoding: .utf8) } ?? "No data"

        print("onExit triggered - \(errorDescription), data: \(dataDescription)")
    }

    func onEvent(_ data: [String: Any]) {
        let dataDescription = (try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted))
            .flatMap { String(data: $0, encoding: .utf8) } ?? "{}"

        print("onEvent triggered - data: \(dataDescription)")
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
