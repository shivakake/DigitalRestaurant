//
//  BannerCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var thanksLable: UILabel!
    @IBOutlet weak var bookNowButtonView: UIView!
    
    let styleLibrary = StyleLibrary()
    var comingFrom = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        offerLabel.showStyle(with: .small, weight: .semibold, color: .white)
        percentLabel.showStyle(with: .largeTitle, weight: .bold, color: .white)
        offLabel.showStyle(with: .content, color: .white)
        thanksLable.showStyle(with: .small, weight: .semibold, color: .white)
    }
    
    func configureCell(imageName: UIImage) {
        bannerImageView.image = imageName
        if comingFrom == "Details" {
            bannerImageView.layer.cornerRadius = 5
            offerLabel.isHidden = true
            percentLabel.isHidden = true
            offLabel.isHidden = true
            thanksLable.isHidden = true
            bookNowButtonView.isHidden = true
        }
    }
}
