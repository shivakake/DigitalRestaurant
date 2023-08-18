//
//  AboutTableViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        aboutTitleLabel.showStyle(with: .content, weight: .medium)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(title: String?) {
        aboutTitleLabel.text = title
    }
}
