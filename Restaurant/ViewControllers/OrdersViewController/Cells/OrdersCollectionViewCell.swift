//
//  OrdersCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 12/06/23.
//

import UIKit
import ComponentUI

class OrdersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var orderTitleLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    @IBOutlet weak var paidButton: UIButton!
    @IBOutlet weak var cancelOrderButton: UIButton!
    @IBOutlet weak var trackOrderButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.styleWithShadow()
        orderImageView.layer.cornerRadius = 10
        orderTitleLabel.showStyle(with: .small, weight: .bold)
        orderCountLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        orderPriceLabel.showStyle(with: .content, color: styleLibrary.appColor)
        trackOrderButton.styleWithShadow()
        cancelOrderButton.styleWithShadow()
        cancelOrderButton.layer.borderWidth = 1
        cancelOrderButton.layer.borderColor = styleLibrary.appColor.cgColor
    }
    
    func configureCell(model: OrdersListDataModel?) {
        
        orderImageView.image = UIImage(named: model?.orderImage ?? "")
        orderTitleLabel.text = model?.orderTitle
        orderCountLabel.text = "\(model?.ordersCount ?? "0") items"
        orderPriceLabel.text = " $ \(model?.ordersPrice ?? "0")"
        
        
        
        if model?.isPaid == true {
            paidButton.setTitle("Paid", for: .normal)
            paidButton.showStyle(with: .meta, weight: .bold, textColor: .white, bgColor: .systemGreen, needCircularCorners: true)
            cancelOrderButton.showStyle(with: .meta, weight: .bold, textColor: styleLibrary.appColor, bgColor: .white, needCircularCorners: false)
            trackOrderButton.showStyle(with: .meta, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        } else {
            paidButton.setTitle("Cancelled", for: .normal)
            paidButton.showStyle(with: .meta, weight: .bold, textColor: styleLibrary.appColor, bgColor: .clear, needCircularCorners: true)
            paidButton.layer.borderWidth = 1
            paidButton.layer.borderColor = styleLibrary.appColor.cgColor
            cancelOrderButton.showStyle(with: .meta, weight: .bold, textColor: .white , bgColor: styleLibrary.appColor, needCircularCorners: false)
            trackOrderButton.showStyle(with: .meta, weight: .bold, textColor: styleLibrary.appColor, bgColor: .white, needCircularCorners: false)
        }
    }
    
    @IBAction func paidButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func cancelOrderButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func trackOrderButtonTapped(_ sender: UIButton) {
    }
}
