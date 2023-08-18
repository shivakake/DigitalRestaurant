//
//  DiscountCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import ComponentUI

class DiscountCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var discountImageView: UIImageView!
    @IBOutlet weak var discountSelectionImageView: UIImageView!
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var discountDetailsLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.showStyleToView(viewRadius: 10, borderWidth: 1, borderColor: styleLibrary.subHeadingOrContent)
        discountTitleLabel.showStyle(with: .content)
        discountDetailsLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: DiscountsListDataModel?) {
        discountTitleLabel.text = model?.discountTitle
        discountImageView.image = UIImage(named: model?.discountImage ?? "")
        discountDetailsLabel.text = model?.discountDetails
        
        if model?.isSelected == true {
            discountSelectionImageView.image = UIImage(named: "selected")
        } else {
            discountSelectionImageView.image = UIImage(named: "selection")
        }
    }
    
    @IBAction func discountSelectionButtonTapped(_ sender: UIButton) {
        
    }
}
