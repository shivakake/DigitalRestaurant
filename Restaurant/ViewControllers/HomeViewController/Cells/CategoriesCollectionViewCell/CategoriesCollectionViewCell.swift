//
//  CategoriesCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.layer.backgroundColor = UIColor.white.cgColor
        cellBackGroundView.layer.cornerRadius = 10
        categoryImageView.layer.cornerRadius = categoryImageView.layer.frame.size.height / 2
        categoryTitleLabel.showStyle(with: .content, weight: .medium)
    }
    
    func configureCell(model: CategoriesDataModel?) {
        categoryTitleLabel.text = model?.title
        categoryImageView.image = UIImage(named: model?.image ?? "")
        cellBackGroundView.layer.borderWidth = 1.5
        cellBackGroundView.layer.borderColor = styleLibrary.appColor.cgColor
        if model?.isSelected == true {
            cellBackGroundView.layer.backgroundColor = styleLibrary.appColor.cgColor
            categoryTitleLabel.textColor = UIColor.white
        } else {
            cellBackGroundView.layer.backgroundColor = UIColor.white.cgColor
            categoryTitleLabel.textColor = styleLibrary.appColor
        }
    }
    
}
