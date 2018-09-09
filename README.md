# OBLanguageManager

[![CI Status](https://img.shields.io/travis/bassyouni/OBLanguageManager.svg?style=flat)](https://travis-ci.org/bassyouni/OBLanguageManager)
[![Version](https://img.shields.io/cocoapods/v/OBLanguageManager.svg?style=flat)](https://cocoapods.org/pods/OBLanguageManager)
[![License](https://img.shields.io/cocoapods/l/OBLanguageManager.svg?style=flat)](https://cocoapods.org/pods/OBLanguageManager)
[![Platform](https://img.shields.io/cocoapods/p/OBLanguageManager.svg?style=flat)](https://cocoapods.org/pods/OBLanguageManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Description
OBLanguageManager allows you to change the language of your app within the app and without the need to restart.Also it helps mange your localization and supports Right to left orientation for languages like Arabic, Hebrew, etc..
OBLanguageManager is easy, small, and in Swift :).
DESC

## Installation

OBLanguageManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OBLanguageManager'
```

## Usage

To get Started all you need is to add a variable with language name that equals the language code
```ruby
let OBArabic: String = "ar"
```
then added in 'isSupportedLanguage' method.

Then you can Localize a String with it's key
```ruby
someLabel.text = OBLanguageManager.localizedString(key: "good_morning")
```
To Set a Language
```ruby
OBLanguageManager.setSelectedLanguage(language: "en")
```
To change the orientation to Right to Left 
```ruby
OBLanguageManager.forceRightToLeft(storyboard: storyboard,rootVCIdentifier: "root")
```
Note that to change the orientation you have to go back to the root view controller and change the the window.rootViewController to it. the method above does it automatically, you can do it manully and just remove the parameters
```ruby
OBLanguageManager.forceRightToLeft()
```

## Author

Bassyouni, omae.bassyouni991@gmail.com

## License

OBLanguageManager is available under the MIT license. See the LICENSE file for more info.
