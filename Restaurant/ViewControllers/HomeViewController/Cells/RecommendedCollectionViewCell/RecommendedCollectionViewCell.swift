//
//  RecommendedCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var recommendedImageView: UIImageView!
    @IBOutlet weak var recommendedTitleLabel: UILabel!
    @IBOutlet weak var star1Button: UIButton!
    @IBOutlet weak var star2Button: UIButton!
    @IBOutlet weak var star3Button: UIButton!
    @IBOutlet weak var star4Button: UIButton!
    @IBOutlet weak var star5Button: UIButton!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.styleWithShadow()
        recommendedImageView.layer.cornerRadius = 10
        recommendedImageView.contentMode = .scaleAspectFill
        recommendedTitleLabel.showStyle(with: .small, weight: .medium)
        deliveryTimeLabel.showStyle(with: .meta)
        ratingLabel.showStyle(with: .meta)
        priceLabel.showStyle(with: .content, color: styleLibrary.appColor)
    }
    
    func configureCell(model: RecommendedListDataModel?) {
        recommendedImageView.image = UIImage(named: model?.image ?? "")
        if model?.liked == true {
            favoriteImageView.image = UIImage(systemName: "heart")
        } else {
            favoriteImageView.image = UIImage(systemName: "heart.fill")
        }
        recommendedTitleLabel.text = model?.title
        deliveryTimeLabel.text = model?.deliveryTime
        ratingLabel.text = model?.rating
        priceLabel.text = model?.price
    }
    
    @IBAction func star1ButtonTapped(_ sender: UIButton) {
    }
    @IBAction func star2ButtonTapped(_ sender: UIButton) {
    }
    @IBAction func star3ButtonTapped(_ sender: UIButton) {
    }
    @IBAction func star4ButtonTapped(_ sender: UIButton) {
    }
    @IBAction func star5ButtonTapped(_ sender: UIButton) {
    }
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }
}
