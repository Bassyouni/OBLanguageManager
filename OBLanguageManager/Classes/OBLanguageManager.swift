//
//  OBLanguageManager.swift
//  OBLanguageManager
//
//  Created by Bassyouni on 9/9/18.
//

import UIKit

// Supported languages.
// Add your specific supported languaages here.
let OBDefaultLanguage: String = "en"
let OBArabic: String = "ar"


public class OBLanguageManager
{
    private static let OBSelectedLanguageKey = "OBSelectedLanguageKey"
    private static let OBIsRightToLeftKey = "OBIsLeftToRightKey"
    
    // Update this method with your specific supported languages.
    public static func isSupportedLanguage(language: String) -> Bool
    {
        if language == OBDefaultLanguage
        {
            return true
        }
        if language == OBArabic
        {
            return true
        }
        
        return false
    }
    
    public static func localizedString(key: String) -> String
    {
        let selectedLanguage = self.selectedLanguage()
        
        // Get the corresponding bundle path
        if let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
        {
            // Get the corresponding localized string.
            let languageBundle = Bundle(path: path)
            if let localizedString = languageBundle?.localizedString(forKey: key, value: "", table: nil)
            {
                return localizedString
            }
        }
        return ""
    }
    
    public static func setSelectedLanguage(language: String)
    {
        let userDefaults = UserDefaults.standard
        
        //check if the desired language is supported
        if self.isSupportedLanguage(language: language)
        {
            userDefaults.set(language, forKey: OBSelectedLanguageKey)
        }
        else
        {
            // if the desired language is not supported, set selectedLanguage to nil.
            userDefaults.set(nil, forKey: OBSelectedLanguageKey)
        }
    }
    
    public static func selectedLanguage() -> String
    {
        // Get selected language from user defaults.
        let userDefaults = UserDefaults.standard
        let selectedLanguage = userDefaults.string(forKey: OBSelectedLanguageKey)
        
        // if the language is not defined in user defaults yet...
        if selectedLanguage == nil
        {
            // Get the system language.
            if let userLanguages: [String] = userDefaults.object(forKey: "AppleLanguages") as? [String]
            {
                let systemLanguage: String = userLanguages[0]
                
                // if system language is supported by LanguageManager, set it as selected language.
                if self.isSupportedLanguage(language: systemLanguage)
                {
                    self.setSelectedLanguage(language: systemLanguage)
                }// if not...
                else
                {
                    // Set the LanguageManager default language as selected language.
                    self.setSelectedLanguage(language: OBDefaultLanguage)
                }
            }
        }
        return userDefaults.string(forKey: OBSelectedLanguageKey)!
    }
    
    /// This method forces the app to change its orienation to right to left orientation, this should be used in
    /// languages like arabic, Hebrew, etc..
    ///
    /// if the parameters is passed, it will go back to the root view controller and change its orientation.
    ///
    /// else you must do it manually or in the AppDelegate didFinishLaunchingWithOptions
    /// - Parameters:
    ///   - storyboard: The storyboard from which the view controller originated.
    ///   - identifier: Root viewController identifier
    @available(iOS 9.0, *)
    public static func forceRightToLeft(storyboard: UIStoryboard? = nil, rootVCIdentifier identifier: String? = nil)
    {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
        
        if let storyboard = storyboard , let identifier = identifier
        {
            //applicationNavigationController is Application Default Navigation Controller if let
            let applicationNavigationController = storyboard.instantiateViewController(withIdentifier: identifier)
            UIApplication.shared.keyWindow?.rootViewController = applicationNavigationController
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: OBIsRightToLeftKey)
        
    }
    
    /// This method forces the app to change its orienation to left to right orientation, this should be used in
    /// languages like arabic, Hebrew, etc..
    ///
    /// if the parameters is passed, it will go back to the root view controller and change its orientation.
    ///
    /// else you must do it manually or in the AppDelegate didFinishLaunchingWithOptions
    /// - Parameters:
    ///   - storyboard: The storyboard from which the view controller originated.
    ///   - identifier: Root viewController identifier
    @available(iOS 9.0, *)
    public static func forceLeftToRight(storyboard: UIStoryboard? = nil, rootVCIdentifier identifier: String? = nil)
    {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
        
        if let storyboard = storyboard, let identifier = identifier
        {
            //applicationNavigationController is Application Default Navigation Controller if let
            let applicationNavigationController = storyboard.instantiateViewController(withIdentifier: identifier)
            UIApplication.shared.keyWindow?.rootViewController = applicationNavigationController
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: OBIsRightToLeftKey)
        
    }
    
    
    /// Boolean value cheaking if the application orientation is 'Right to Left'
    public static func isRightToLeft() -> Bool
    {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: OBIsRightToLeftKey)
    }
    
    /// Returns UserDefaults Language key that is being used
    public static func getUserDefualtsLanguageKey() -> String
    {
        return OBSelectedLanguageKey
    }
    
    
}


