# CMD: rake install_safari_launcher[7f29f76b69e822834077ce10afd24a72a11d7cdd]
desc 'Install SafariLauncher.ipa onto the iOS device'
task :install_safari_launcher, [:udid] do | t, args|
  file = File.join(Dir.pwd, './SafariLauncher.ipa')
  system("ideviceinstaller -u #{args[:udid]} -i #{file}")
end

# CMD: rake uninstall_safari_launcher[7f29f76b69e822834077ce10afd24a72a11d7cdd]
desc 'Uninstall SafariLauncher app from a given iOS device.'
task :uninstall_safari_launcher, [:udid] do | t, args|
  system("ideviceinstaller -u #{args[:udid]} -U com.bytearc.SafariLauncher")
end
