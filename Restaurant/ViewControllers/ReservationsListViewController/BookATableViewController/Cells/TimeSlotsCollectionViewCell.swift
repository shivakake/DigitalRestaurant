//
//  TimeSlotsCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 03/06/23.
//

import UIKit
import ComponentUI

class TimeSlotsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var timeSlotLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell() 
    }
    
    fileprivate func setupCell() {
        timeSlotLabel.showStyle(with: .meta, color: .gray)
    }
    
    func configureCell(model: CategoriesDataModel?) {
        timeSlotLabel.text = model?.title
        if model?.isSelected == true {
            timeSlotLabel.textColor = styleLibrary.appColor
            cellBackGroundView.showStyleToView(viewRadius: 10, borderWidth: 1.5, borderColor: styleLibrary.appColor)
        } else {
            timeSlotLabel.textColor = styleLibrary.subHeadingOrContent
            cellBackGroundView.showStyleToView(viewRadius: 10, borderWidth: 1.5, borderColor: styleLibrary.subHeadingOrContent)
        }
    }
}
