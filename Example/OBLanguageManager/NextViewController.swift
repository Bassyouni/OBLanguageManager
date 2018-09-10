//
//  NextViewController.swift
//  OBLanguageManager_Example
//
//  Created by Bassyouni on 9/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import OBLanguageManager

class NextViewController: UIViewController {
    
    //MARK:- IBOutltes
    @IBOutlet weak var textAlignmentLabel: UILabel!
    @IBOutlet weak var changeLanguageBtn: UIButton!
    
    //MARK:- View's Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to remove the text from the back button
        if let topItem = self.navigationController?.navigationBar.topItem
        {
            topItem.backBarButtonItem = UIBarButtonItem(title: "" , style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        textAlignmentLabel.text = OBLanguageManager.localizedString(key: "text_alignmnet")
        changeLanguageBtn.setTitle(OBLanguageManager.localizedString(key: "change_language"), for: .normal)
        
    }
    
    //MARK:- IBActions
    @IBAction func changeLanguageBtnPressed(_ sender: UIButton) {
        if OBLanguageManager.selectedLanguage() == "ar"
        {
            OBLanguageManager.setSelectedLanguage(language: "en")
            OBLanguageManager.forceLeftToRight(storyboard: storyboard, rootVCIdentifier: "root")
        }
        else
        {
            OBLanguageManager.setSelectedLanguage(language: "ar")
            OBLanguageManager.forceRightToLeft(storyboard: storyboard, rootVCIdentifier: "root")
        }
        
        
    }

}

