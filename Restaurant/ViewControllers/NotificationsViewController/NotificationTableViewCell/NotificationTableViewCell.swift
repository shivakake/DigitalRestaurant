//
//  NotificationTableViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit
import ComponentUI

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationDescriptionLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupCell() {
        notificationImageView.layer.cornerRadius = notificationImageView.layer.frame.size.height / 2
        notificationTitleLabel.showStyle(with: .small)
        notificationDescriptionLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: NotificationDataModel?) {
        notificationImageView.image = UIImage(named: model?.image ?? "")
        notificationTitleLabel.text = model?.title
        notificationDescriptionLabel.text = model?.description
    }
}
