# ScribeUpSDK


### Installation
The ScribeUp iOS SDK is available via Swift Package Manager. To add the SDK to your project, add the following repository URL as a package dependency:

```
https://github.com/ScribeUp/scribeup-sdk-ios
```

Latest Version
```
0.0.1
```

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