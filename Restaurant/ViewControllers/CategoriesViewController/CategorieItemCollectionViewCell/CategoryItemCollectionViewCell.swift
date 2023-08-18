//
//  CategoryItemCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit
import ComponentUI

protocol CategoryItemCollectionViewCellDelegate: AnyObject {
    func tappedOnPlus(index: Int)
    func tappedOnMinus(index: Int)
}

class CategoryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    weak var delegate : CategoryItemCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.styleWithShadow()
        categoryImageView.layer.cornerRadius = 10
        categoryImageView.contentMode = .scaleAspectFill
        favoriteImageView.tintColor = styleLibrary.appColor
        favoriteImageView.image = UIImage(systemName: "heart.fill")
        categoryTitleLabel.showStyle(with: .small, weight: .medium)
        deliveryTimeLabel.showStyle(with: .meta)
        ratingLabel.showStyle(with: .meta)
        priceLabel.showStyle(with: .content, color: styleLibrary.appColor)
        quantityLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: RecommendedListDataModel?) {
        categoryImageView.image = UIImage(named: model?.image ?? "")
        if model?.liked == true {
            favoriteImageView.tintColor = styleLibrary.subHeadingOrContent
        }
        categoryTitleLabel.text = model?.title
        deliveryTimeLabel.text = model?.deliveryTime
        ratingLabel.text = model?.rating
        priceLabel.text = model?.price
        if let qunatity = model?.quantity {
            quantityLabel.text = "\(String(describing: qunatity))"
        }
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        delegate?.tappedOnMinus(index: sender.tag)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        delegate?.tappedOnPlus(index: sender.tag)
    }
}
