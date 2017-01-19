# appium-capybara-seed
Skeleton automation framework which tests web applications on desktop and mobile browsers
using [appium](http://appium.io/),  [capybara](https://github.com/teamcapybara/capybara) and [cucumber](https://cucumber.io).

This starter project can run automated tests on native iOS or Android browsers (physical device or simulator)
as well as Chrome, Firefox, Safari, IE and Edge on the desktop.  

## Environment
In order to use this repo, the environment must be setup properly.

#### Mac OS X
1. Install [Xcode](https://developer.apple.com/xcode) if not already installed 
2. Install [Xcode Command Line Tools](https://developer.apple.com/xcode/features) if not already installed 
3. Install [Homebrew](http://brew.sh) if not already installed 
4. Install [RVM](https://rvm.io/rvm/install) if not already installed 
5. Install [Node.js](https://nodejs.org) if not already installed (use homebrew to install) 
6. Configure ruby version and install global gems: 
  ```bash
  # Install ruby-2.3.3 to RVM
  rvm install ruby -v 2.3.3

  # Set ruby-2.3.3 as the ruby version and verify it is set
  rvm use 2.3.3 && ruby -v

  # Install bundler gem (in order to execute 'bundle install' from CLI)
  gem install bundler
  ```
7. Install [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/) for Google Chrome using homebrew: 
  ```bash
  # Install chromedriver
  brew install chromedriver

  # Verify chromedriver has been installed 
  chromedriver -v
  ``` 
8. Install [geckodriver](https://github.com/mozilla/geckodriver) for Mozilla Firefox using homebrew 
  ```bash
  # Install geckodriver
  brew install geckodriver

  # Verify geckodriver has been installed
  geckodriver --version
  ``` 
9. Install [appium](http://appium.io) as a global node module 
  ```bash
  # Install appium to system nodejs
  node install -g appium

  # Verify appium has been installed
  appium -v

  #Install optional appium dependencies
  brew install carthage
  brew install appium-doctor
  ```
10. Install [ios_webkit_debug_proxy](http://appium.io/slate/en/master/?ruby#ios-webkit-debug-proxy) with  homebrew 
  ```bash
  # brew install --HEAD libimobiledevice
  brew install ios-webkit-debug-proxy
  # turn on the web inspector on iOS device (settings > safari > advanced)
  # start proxy: ios_webkit_debug_proxy -c <DEVICE_UDID>:27753 -d
  ```

## Run Tests
``` bash
# Start appium server 
appium 

# iPhone/iPad Only: Open another terminal window/tab and start the ios_webkit_debug_proxy
ios_webkit_debug_proxy -c <DEVICE_UDID>:27753 -d

# Open new terminal window and go to the repo's root directory on your computer
cd path/to/the/repo/appium-capybara-seed

# Install gems listed in Gemfile to vendor/gems (will take a little while)
bundle install 

# Execute cucumber to begin testing
# See config/cucumber.yml for profiles. I HIGHLY recommend using cucumber profiles. 
bundle exec cucumber --profile chrome

# run on Firefox
bundle exec cucumber --profile firefox

# run on iphone 6s simulator
bundle exec cucumber --profile iphone_6s_sim

# run on iphone 6s device (NOTE: must have SafariLoader.ipa installed on phone and ios_webkit_debug_proxy running)
bundle exec cucumber --profile iphone_6s_device

# run on iphone 6 device (NOTE: must have SafariLoader.ipa installed on phone and ios_webkit_debug_proxy running)
bundle exec cucumber --profile iphone_6_device

# run on chrome and generate a .html test results report file
bundle exec cucumber --profile chrome --profile html_report
```
