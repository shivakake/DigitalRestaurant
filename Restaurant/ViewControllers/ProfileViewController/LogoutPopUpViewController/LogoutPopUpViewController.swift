//
//  LogoutPopUpViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit
import ComponentUI

class LogoutPopUpViewController: UIViewController {
    
    @IBOutlet weak var logoutTitleLabel: UILabel!
    @IBOutlet weak var wantToLogoutLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    var logouCallBack: (() -> Void)?
    
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
        logoutTitleLabel.showStyle(with: .content, weight: .bold)
        wantToLogoutLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        logoutButton.showStyle(with: .content, weight: .medium, textColor: styleLibrary.appColor, bgColor: .clear, needCircularCorners: false)
        cancelButton.showStyle(with: .content,  weight: .medium, textColor: styleLibrary.appColor, bgColor: .clear, needCircularCorners: false)
//        popUpView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popUpView.layer.cornerRadius = 15
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        logouCallBack?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
