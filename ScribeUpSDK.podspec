Pod::Spec.new do |s|
  # ---- Basic metadata ----------------------------------------------------
  s.name             = 'ScribeUpSDK'
  s.version          = '0.6.4'
  s.summary          = 'ScribeUp iOS SDK'
  s.swift_version    = '5.0'

  s.description      = <<-DESC
    The ScribeUp iOS SDK lets you embed the Subscription Manager
    so users can track and manage their subscriptions without
    leaving your app.
  DESC

  s.homepage         = 'https://github.com/ScribeUp/scribeup-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ScribeUp' => 'support@scribeup.io' }

  # ---- Source & platform --------------------------------------------------
  s.source           = {
    :git => 'https://github.com/ScribeUp/scribeup-sdk-ios.git',
    :tag => s.version.to_s
  }
  s.ios.deployment_target = '12.0'

  # ---- Subspec that houses the binary framework --------------------------
  s.default_subspec = 'ScribeUpSDK'

  s.subspec 'ScribeUpSDK' do |ss|
    ss.vendored_frameworks = 'Sources/ScribeUpSDK/ScribeUpSDK.xcframework'
    ss.ios.deployment_target = '12.0'
  end
end