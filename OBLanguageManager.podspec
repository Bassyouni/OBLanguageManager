#
# Be sure to run `pod lib lint OBLanguageManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OBLanguageManager'
  s.version          = '0.1.0'
  s.summary          = 'OBLanguageManager helps you manage your localization and supports Right to left orientation for languages like Arabic, Hebrew, etc..'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OBLanguageManager allows you to change the language of your app within the app and without the need to restart.
OBLanguageManager is easy, small, and in Swift :).
                       DESC

  s.homepage         = 'https://github.com/bassyouni/OBLanguageManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bassyouni' => 'omae.bassyouni991@gmail.com' }
  s.source           = { :git => 'https://github.com/bassyouni/OBLanguageManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = "4.2"

  s.source_files = 'OBLanguageManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OBLanguageManager' => ['OBLanguageManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
