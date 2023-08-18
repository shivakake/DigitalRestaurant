//
//  LanguagesCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import ComponentUI

class LanguagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var languageLetterImageView: UIImageView!
    @IBOutlet weak var languageTitleImageView: UIImageView!
    @IBOutlet weak var okayImageView: UIImageView!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    fileprivate func setupCell() {
        cellBackGroundView.showStyleToView(viewRadius: 10, borderWidth: 1, borderColor: .lightGray)
        okayImageView.isHidden = true
    }
    
    func configureCell(model: LanguageListDataModel?) {
        
        languageLetterImageView.image = UIImage(named: model?.languageLetterImage ?? "")
        languageTitleImageView.image = UIImage(named: model?.languageTitleImage ?? "")
        
        if model?.isSelected == true {
            okayImageView.isHidden = false
            cellBackGroundView.layer.borderColor = styleLibrary.appColor.cgColor
        } else {
            cellBackGroundView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
            okayImageView.isHidden = true
        }
    }
}
