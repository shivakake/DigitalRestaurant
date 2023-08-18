//
//  BookingSelectionCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 03/06/23.
//

import UIKit
import ComponentUI

class BookingSelectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeTitleLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.layer.cornerRadius = 10
        cellBackGroundView.showStyleToView(viewRadius: 7, borderWidth: 1, borderColor: styleLibrary.appColor)
        typeTitleLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: CategoriesDataModel?) {
        typeTitleLabel.text = model?.title
        typeImageView.image = UIImage(named: model?.image ?? "")
        if model?.isSelected == true {
            cellBackGroundView.layer.borderColor = styleLibrary.appColor.cgColor
            typeImageView.tintColor = styleLibrary.appColor
        } else {
            cellBackGroundView.layer.borderColor = UIColor.darkGray.cgColor
            typeImageView.tintColor = .black
        }
    }
}
