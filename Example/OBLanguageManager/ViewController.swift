//
//  ViewController.swift
//  OBLanguageManager
//
//  Created by bassyouni on 09/09/2018.
//  Copyright (c) 2018 bassyouni. All rights reserved.
//

import UIKit
import OBLanguageManager

class ViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var goodMorningLabel: UILabel!
    @IBOutlet weak var selectLanguageLabel: UILabel!
    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var arabicBtn: UIButton!
    @IBOutlet weak var textAlignmentLabel: UILabel!
    @IBOutlet weak var nextBtn: UIBarButtonItem!
    
    //MARK:- View's Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
    }
    
    //MARK:- IBActions
    @IBAction func englishBtnPressed(_ sender: UIButton) {
        OBLanguageManager.setSelectedLanguage(language: "en")
        OBLanguageManager.forceLeftToRight(storyboard: storyboard,rootVCIdentifier: "root")
        setupLocalization()
    }
    
    
    @IBAction func arabicBtnPressed(_ sender: UIButton) {
        OBLanguageManager.setSelectedLanguage(language: "ar")
        OBLanguageManager.forceRightToLeft(storyboard: storyboard,rootVCIdentifier: "root")
        setupLocalization()
    }
    
    //MARK:- Methods
    func setupLocalization()
    {
        goodMorningLabel.text = OBLanguageManager.localizedString(key: "good_morning")
        selectLanguageLabel.text = OBLanguageManager.localizedString(key: "select_language")
        textAlignmentLabel.text = OBLanguageManager.localizedString(key: "text_alignmnet")
        englishBtn.setTitle(OBLanguageManager.localizedString(key: "english"), for: .normal)
        arabicBtn.setTitle(OBLanguageManager.localizedString(key: "arabic"), for: .normal)
        nextBtn.title = OBLanguageManager.localizedString(key: "next")
    }

}

