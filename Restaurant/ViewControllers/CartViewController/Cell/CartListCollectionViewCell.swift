//
//  CartListCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 13/06/23.
//

import UIKit
import ComponentUI

protocol CartListCollectionViewCellDelegate: AnyObject {
    func tappedOnPlus(index: Int)
    func tappedOnMinus(index: Int)
}

class CartListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var cartItemImageView: UIImageView!
    @IBOutlet weak var cartItemTitleLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    weak var delegate : CartListCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.styleWithShadow()
        cartItemImageView.layer.cornerRadius = 10
        cartItemImageView.contentMode = .scaleAspectFill
        cartItemTitleLabel.showStyle(with: .small, weight: .medium)
        deliveryTimeLabel.showStyle(with: .meta)
        caloriesLabel.showStyle(with: .meta)
        priceLabel.showStyle(with: .content, color: styleLibrary.appColor)
        quantityView.layer.cornerRadius = quantityView.frame.size.height / 2
        quantityLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: CartListDataModel?) {
        cartItemImageView.image = UIImage(named: model?.image ?? "")
        cartItemTitleLabel.text = model?.title
        deliveryTimeLabel.text = model?.deliveryTime
        caloriesLabel.text = "\(model?.quantity ?? 0)"
        priceLabel.text = model?.price
        if let qunatity = model?.quantity {
            quantityLabel.text = "\(String(describing: qunatity))"
        }
    }
    
    @IBAction func deleteIButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        delegate?.tappedOnMinus(index: sender.tag)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        delegate?.tappedOnPlus(index: sender.tag)
    }
}
