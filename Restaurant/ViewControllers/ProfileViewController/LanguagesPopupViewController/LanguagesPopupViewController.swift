//
//  LanguagesPopupViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import ComponentUI

class LanguagesPopupViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var languagesTitleLabel: UILabel!
    @IBOutlet weak var languagesCollectionView: UICollectionView!
    
    let styleLibrary = StyleLibrary()
    var languagesListArray = [
        LanguageListDataModel(languageLetterImage: "aa telugu", languageTitleImage: "telugu", isSelected: false),
        LanguageListDataModel(languageLetterImage: "Aeng", languageTitleImage: "telugu", isSelected: true),
        LanguageListDataModel(languageLetterImage: "Ahindi", languageTitleImage: "Hindi.svg", isSelected: false),
        LanguageListDataModel(languageLetterImage: "atamil", languageTitleImage: "tamil", isSelected: false),
        LanguageListDataModel(languageLetterImage: "aa kanada", languageTitleImage: "kanada", isSelected: false),
        LanguageListDataModel(languageLetterImage: "abengali", languageTitleImage: "bengali", isSelected: false),
        LanguageListDataModel(languageLetterImage: "Amarathi", languageTitleImage: "marathi", isSelected: false),
        LanguageListDataModel(languageLetterImage: "amalyali", languageTitleImage: "malyali", isSelected: false),
        LanguageListDataModel(languageLetterImage: "gujratifont", languageTitleImage: "gujrati", isSelected: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        if Device.isPhone {
        //            bannerCollectionViewHeightConstraint.constant = 175
        //        } else {
        //            bannerCollectionViewHeightConstraint.constant = 350
        //        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        languagesCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        languagesTitleLabel.showStyle(with: .content, weight: .bold)
        popUpView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popUpView.layer.cornerRadius = 30.0
    }
    
    func registerColletionViewCellAndDelegate(){
        languagesCollectionView?.register(UINib(nibName: "LanguagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LanguagesCollectionViewCell")
        languagesCollectionView?.delegate = self
        languagesCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?) {
        for (index, item) in languagesListArray.enumerated() {
            languagesListArray[index].isSelected = item.languageLetterImage == category
        }
        languagesCollectionView.reloadCollectionView()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LanguagesPopupViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languagesListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = languagesCollectionView.dequeueReusableCell(withReuseIdentifier: "LanguagesCollectionViewCell", for: indexPath) as? LanguagesCollectionViewCell {
            cell.configureCell(model: languagesListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension LanguagesPopupViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
//            print(languagesListArray[indexpath].languageTitleImage)
            selectedTab(category: languagesListArray[indexPath.row].languageLetterImage)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension LanguagesPopupViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10) / 2, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
