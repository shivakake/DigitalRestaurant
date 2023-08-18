//
//  PaymentMethodTableViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 14/06/23.
//

import UIKit

class PaymentMethodTableViewCell: UITableViewCell {

    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymentMethodTitleLabel: UILabel!
    @IBOutlet weak var separatorLineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        paymentMethodTitleLabel.showStyle(with: .small)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(model: PaymentMethodDataModel?) {
        paymentMethodImageView.image = UIImage(named: model?.image ?? "")
        paymentMethodTitleLabel.text = model?.title
    }
}
