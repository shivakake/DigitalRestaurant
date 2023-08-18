//
//  ChangePasswordPopUpViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit
import ComponentUI

class ChangePasswordPopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var changePasswordTitleLabel: UILabel!
    @IBOutlet var subTitleLables: [UILabel]!
    @IBOutlet var passwordContainsTitleLabels: [UILabel]!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func commonMethods() {
        setupUI()
    }
    
    func setupUI() {
        changePasswordTitleLabel.showStyle(with: .content, weight: .medium, color: styleLibrary.appColor)
        for label in subTitleLables {
            label.showStyle(with: .meta, color: styleLibrary.appColor)
        }
        for label in passwordContainsTitleLabels {
            label.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        }
        changePasswordButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.meta, needCircularCorners: false)
        popUpView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popUpView.layer.cornerRadius = 30.0
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changePasswordButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
