require 'appium_capybara'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'site_prism'

require_relative '../../app/app'

Capybara.server_host = '0.0.0.0'
Capybara.server_port = 4723
Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome
Capybara.default_max_wait_time = 30
SitePrism.use_implicit_waits = true

# https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/caps.md
# NOTE: The SafariLauncher.app must be installed on the device to begin with. Otherwise, it will not run.
# You can install the SafariLauncher using rake task 'install_safari_launcher'
# appium_ios_opts[:caps][:app] = File.join(Dir.pwd, './SafariLauncher.zip')
appium_ios_opts = { appium_lib: {}, caps: {} }
appium_ios_opts[:appium_lib][:server_url] = 'http://localhost:4723/wd/hub'
appium_ios_opts[:appium_lib][:debug] = true
appium_ios_opts[:caps][:platformName] = ENV['PLATFORM_NAME'] || 'iOS'
appium_ios_opts[:caps][:platformVersion] = ENV['PLATFORM_VERSION'] || ''
appium_ios_opts[:caps][:deviceName] = ENV['DEVICE_NAME'] || ''
appium_ios_opts[:caps][:browserName] = ENV['BROWSER_NAME'] || 'Safari'
appium_ios_opts[:caps][:noReset] = true
appium_ios_opts[:caps][:bundleId] = ENV['BUNDLE_ID'] || 'com.bytearc.SafariLauncher'
appium_ios_opts[:caps][:udid] = ENV['UDID'] || ''

Capybara.register_driver(:chrome) { |app| Capybara::Selenium::Driver.new(app, browser: :chrome) }
Capybara.register_driver(:firefox) { |app| Capybara::Selenium::Driver.new(app, browser: :firefox) }
Capybara.register_driver(:ios) { |app| Appium::Capybara::Driver.new(app, appium_ios_opts) }

def select_driver
  case ENV['DRIVER']
  when 'chrome'
    Capybara.current_driver = :chrome
  when 'firefox'
    Capybara.current_driver = :firefox
  when 'ios'
    Capybara.current_driver = :ios
  else
    Capybara.use_default_driver
  end
end
