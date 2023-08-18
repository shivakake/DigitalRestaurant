//
//  FavoritesCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit
import ComponentUI

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteTitleLabel: UILabel!
    @IBOutlet weak var likedImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.styleWithShadow()
        favoriteImageView.layer.cornerRadius = 10
        favoriteImageView.contentMode = .scaleAspectFill
        favoriteTitleLabel.showStyle(with: .content, weight: .bold)
        foodTypeLabel.showStyle(with: .meta)
        deliveryTimeLabel.showStyle(with: .meta)
        ratingLabel.showStyle(with: .meta)
        priceLabel.showStyle(with: .content, color: styleLibrary.appColor)
        
    }
    
    func configureCell(model: FevoriteListDataModel?) {
        favoriteImageView.image = UIImage(named: model?.image ?? "")
        likedImageView.tintColor = styleLibrary.appColor
        if model?.liked == true {
            likedImageView.image = UIImage(systemName: "heart.fill")
        } else {
            likedImageView.image = UIImage(systemName: "heart")
        }
        favoriteTitleLabel.text = model?.title
        deliveryTimeLabel.text = model?.deliveryTime
        ratingLabel.text = model?.rating
        priceLabel.text = model?.price
        foodTypeLabel.text = model?.foodType
    }
}
