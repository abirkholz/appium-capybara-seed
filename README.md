# appium-capybara-seed
Skeleton automation framework which tests web applications on desktop and mobile browsers
using [appium](http://appium.io/),  [capybara](https://github.com/teamcapybara/capybara) and [cucumber](https://cucumber.io).

This starter project can run automated tests on native iOS or Android browsers (physical device or simulator)
as well as Chrome, Firefox, Safari, IE and Edge on the desktop.  

Additionally, appium-capybara-seed is designed with the Page Object Model pattern. 
We use the [site_prism](https://github.com/natritmeyer/site_prism) gem as a wrapper to implement the Page Object pattern.

## Environment
In order to use this project, the environment must be configured with necessary dependencies. 
As of right now, the instructions are for Mac OSX but I will provide Windows setup at some point.

#### Mac OS X
1. Install [Xcode](https://developer.apple.com/xcode) if not already installed
2. Install [Xcode Command Line Tools](https://developer.apple.com/xcode/features) if not already installed
3. Install [Homebrew](http://brew.sh) if not already installed
4. Install [RVM](https://rvm.io/rvm/install) if not already installed (don't need RVM but it is recommended)
5. Install [NVM](https://github.com/creationix/nvm) if not already installed (don't need NVM but it is recommended)
6. Configure ruby version and install global gems: 
  ```bash
  # Install ruby-2.3.3 to RVM
  $ rvm install ruby -v 2.3.3

  # Set ruby-2.3.3 as the ruby version and verify it is set
  $ rvm use 2.3.3 && ruby -v

  # Install bundler gem (in order to execute 'bundle install' from CLI)
  $ gem install bundler

  # Install rake gem to run rake tasks
  $ gem install rake
  ```
7. Configure node version and install global node_modules:
  ```bash
  # Install node version 4.4.7 to NVM
  $ nvm install 4.4.7

  # Set node v4.4.7 as the node.js version and verify it is set
  $ nvm use 4.4.7 && node -v

  # Install appium node_module and verify installation
  $ node install -g appium && appium -v

  # Install optional appium dependencies
  $ npm install -g carthage && carthage version 
  $ npm install -g appium-doctor

  # Make sure appium is setup correctly and identify any issues
  $ appium-doctor
  ```
8. Install [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/) for Google Chrome using homebrew:
  ```bash
  # Install chromedriver
  $ brew install chromedriver

  # Verify chromedriver has been installed 
  $ chromedriver -v
  ```
9. Install [geckodriver](https://github.com/mozilla/geckodriver) for Mozilla Firefox using homebrew
  ```bash
  # Install geckodriver
  $ brew install geckodriver

  # Verify geckodriver has been installed
  $ geckodriver --version
  ```
10. Install [ideviceinstaller](https://github.com/libimobiledevice/ideviceinstaller) using homebrew
  ```bash
  # ideviceinstaller allows us to install the SafariLoader.ipa to the iOS device
  $ brew install ideviceinstaller

  ```
11. Install [ios_webkit_debug_proxy](https://github.com/appium/appium/blob/master/docs/en/advanced-concepts/ios-webkit-debug-proxy.md) with homebrew:
  ```bash
  $ brew install ios-webkit-debug-proxy
  
  # brew install --HEAD libimobiledevice
  # turn on the web inspector on iOS device (settings > safari > advanced)
  # start proxy: ios_webkit_debug_proxy -c <DEVICE_UDID>:27753
  ```
12. Update cucumber.yml to match your devices and simulator versions:
  - iOS devices - change UDID to the UDID of your device (find in iTunes when device is connected)
  - iOS simulators - change DEVICE_NAME and PLATFORM_VERSION to match the sims on your computer. 

#### Windows 
> TODO

## Run Tests

#### Mac OS X

Setup for all tests, regardless of platform and browser:
```bash
# Open new terminal window and go to the repo's root directory on your computer
$ cd path/to/the/repo/appium-capybara-seed

# Install gems listed in Gemfile to vendor/gems (will take a little while)
$ bundle install 
```

To run on iOS/Android device or simulator, you must start the appium server:
```bash
$ appium 
```

To run on Safari for the physical iOS device, open a new terminal tab/window and start the proxy server: 
```bash
$ ios_webkit_debug_proxy -c <DEVICE_UDID>:27753 -d
```

Finally, to trigger cucumber tests, run one of these commands (depending on the platform you want to test):
```bash
# The profiles are stored in config/cucumber.yml
# I HIGHLY recommend using cucumber profiles.

# Chrome desktop
$ bundle exec cucumber --profile chrome

# Firefox desktop
$ bundle exec cucumber --profile firefox

# iPhone 6s simulator 
# Note: make sure you have this simulator installed on your Mac - see cucumber.yml
$ bundle exec cucumber --profile iphone_6s_sim

# iPhone 6s device 
# Note: SafariLoader.ipa should be installed on device and ios_webkit_debug_proxy running
$ rake install_safari_launcher[YOUR_iOS_DEVICE_UDID] 
$ bundle exec cucumber --profile iphone_6s_device

# iPhone 6 device
# Note: SafariLoader.ipa should be installed on device and ios_webkit_debug_proxy running
$ rake install_safari_launcher[YOUR_iOS_DEVICE_UDID] 
$ bundle exec cucumber --profile iphone_6_device

# Adding html_report profile to generate an html results file. For example:
$ bundle exec cucumber --profile chrome --profile html_report
```
#### Windows 
> TODO

## Configuring SafariLauncher
In order to run tests against Safari on a physical iOS device, appium requires the SafariLauncher iOS app to be installed on the device.
Once installed, appium uses SafariLauncher to interact with the Safari browser. 
[See appium docs for more information](http://appium.io/slate/en/master/?ruby#automating-mobile-web-apps)

#### Prerequisites
- An Apple Developer ID which allows you to sign and deploy the SafariLauncher app to a physical device. Without this, you cannot deploy to a physical device (only simulator). [More info](https://developer.apple.com/developer-id/) 
- Xcode installed
- Xcode Command Line Tools installed

#### Setup instructions
1. Download the [SafariLauncher](https://github.com/snevesbarros/SafariLauncher) repo onto your local machine
2. Extract the SafariLauncher-master.zip (if it is zipped)
3. Open SafariLauncher-master folder
4. Double click the SafariLauncher.xcodeproj file to open it in Xcode
5. Open the Build Settings for the SafariLauncher target (not the SafariLauncher project)
6. Find the 'Code Signing Identity' section
7. Set the code signing identity to your Apple Developer profile for all debug and release fields
8. Find the 'Provisioning Profile' section (just below Code Signing Identity section)
9. Set the provisioning profile to 'Automatic' for all debug and release fields (this should already be done, so you shouldnt need to change)
10. Find the 'Packaging > Product Bundle Identifier' section 
11. Verify that the Product Bundle Identifier is set to 'com.bytearc.SafariLauncher'. If it is not, then switch it to 'com.bytearc.SafariLauncher'.
12. Clean and build the app 
13. Connect device to computer
14. Launch the app onto the device and make sure it deploys without error. 
15. Once successfully deployed to iOS device, stop the build. 
16. In Xcode, go to 'Product > Archive' in order to begin creating an .ipa file for the SafariLauncher
17. Click the 'export' button
18. Select 'Save for Development' option and then 'next' button
19. Choose the Development Team to use for provisioning 
20. Choose 'Export one app for all compatible devices' and then 'next' button
21. Click the 'export' button
22. Select the location to which the ipa package will be downloaded and change the name of the exported file to 'SafariLauncher'
23. Click 'export' button
24. A SafariLauncher.zip file should now be downloaded to your computer
25. Unzip SafariLauncher.zip
26. Copy the SafariLauncher.ipa to the appium-capybar-seed root directory 
27. Now, run the rake task install_safari_launcher[YOUR_DEVICE_UDID] to deploy the app to the device
28. If successful, the SafariLauncher will display on the device.
29. Keep the app installed on the device so that you don't need to deploy the .ipa each test run. 
30. On the device, go to Settings > Safari > Advanced
31. Turn on Javascript and Web Inspector settings


## Additional Info
- In order to locally execute tests on both iOS and Android platforms, you must use a Mac. This is because Xcode and any iOS development can only be done on OSX. Android can run on either Windows or OSX because it is java based.
- In practice, using something like [BrowserStack](https://www.browserstack.com/) is a great option for regular test execution on multiple platforms. Especially if you are testing in a CI/CD environment.
