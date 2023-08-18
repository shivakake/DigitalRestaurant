//
//  ProfileSettingsTableViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 05/06/23.
//

import UIKit
import ComponentUI

class ProfileSettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var settingsTitleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    var nextCallBack: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupCell() {
        settingsTitleLabel.showStyle(with: .content)
    }
    
    func configureCell(model: ProfileSettingsDataModel?) {
        settingsImageView.image = UIImage(named: model?.image ?? "")
        settingsTitleLabel.text = model?.title
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        nextCallBack?(sender.tag)
    }
}
