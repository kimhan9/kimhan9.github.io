# iOS

## Fastlane

```
# Install ruby
rbenv install 2.7.6

# Install fastlane
xcode-select --install
gem install fastlane -NV
sudo xcodebuild -runFirstLaunch

# Insall fastlane and update
bundle install
bundle exec fastlane update_plugins
bundle update fastlane

# Setup cocapods
sudo gem install cocoapods
pod install
pod update

# Fastlane run test
bundle exec fastlane tests
```

## To generate provision profile

- Update cert/provisioning profile: `fastlane match_adhoc`
- Register new device: `fastlane run register_device udid:"device-id" name:"Kim Hang"`
- Refresh profile with new device `fastlane match adhoc --force`