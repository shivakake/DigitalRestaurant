//
//  ProfileViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 05/06/23.
//

import UIKit
import ComponentUI

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileCoverImageView: UIImageView!
    @IBOutlet weak var profileDetailsView: UIView!
    @IBOutlet weak var myAccountTitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileSettingsTableView: UITableView!
    @IBOutlet weak var profileSettingsTableViewHeightConstraint: NSLayoutConstraint!
    
    let profileSettingListArray = [ProfileSettingsDataModel(image: "settings", title: "Profile Settings"),
                                   ProfileSettingsDataModel(image: "language", title: "Languages"),
                                   ProfileSettingsDataModel(image: "payment", title: "Payment Methods"),
                                   ProfileSettingsDataModel(image: "location-1", title: "Location"),
                                   ProfileSettingsDataModel(image: "favorotes", title: "Fevorites"),
                                   ProfileSettingsDataModel(image: "about", title: "About"),
                                   ProfileSettingsDataModel(image: "logout", title: "Logout")]
    let styleLibrary = StyleLibrary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileSettingsTableViewHeightConstraint.constant = CGFloat((profileSettingListArray.count * 40) + 10)
    }
    func commonMethods() {
        setupUI()
        configureTableView()
    }
    
    fileprivate func setupUI() {
        profileDetailsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        profileDetailsView.layer.cornerRadius = 30.0
        myAccountTitleLabel.showStyle(with: .content, weight: .medium)
        profileNameLabel.showStyle(with: .content, color: styleLibrary.appColor)
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.size.height / 2
    }
    
    fileprivate func configureTableView() {
        profileSettingsTableView.register(UINib(nibName: "ProfileSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileSettingsTableViewCell")
        profileSettingsTableView.dataSource = self
        profileSettingsTableView.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func profileEditButtonTapped(_ sender: UIButton) {
    }
}

extension ProfileViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileSettingListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSettingsTableViewCell", for: indexPath) as? ProfileSettingsTableViewCell {
            cell.nextButton.tag = indexPath.row
            cell.configureCell(model: profileSettingListArray[indexPath.row])
            cell.nextCallBack = { [weak self] settingIndex in
                guard let _self = self else { return }
                if let title = _self.profileSettingListArray[settingIndex].title {
                    _self.navigateToViewController(title: title)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func navigateToViewController(title: String?) {
        switch title {
        case "Profile Settings":
            let controller = EditProfileViewController()
            navigationController?.pushViewController(controller, animated: true)
            break
        case "Languages":
            let controller = LanguagesPopupViewController()
            controller.modalPresentationStyle = .overCurrentContext
            self.present(controller, animated: true, completion: nil)
        case "Payment Methods":
            break
        case "Location":
            let controller = LocationViewController()
            navigationController?.pushViewController(controller, animated: true)
        case "Fevorites":
            let controller = FavoritesViewController()
            navigationController?.pushViewController(controller, animated: true)
        case "About":
            let controller = AboutViewController()
            navigationController?.pushViewController(controller, animated: true)
        default:
            let controller = LogoutPopUpViewController()
            controller.modalPresentationStyle = .overCurrentContext
            controller.logouCallBack = { [weak self] in
                guard let _self = self else { return }
                let controller = LoginViewController()
                _self.navigationController?.pushViewController(controller, animated: true)
            }
            self.present(controller, animated: true, completion: nil)
        /*
         self.present(controller, animated: true) {
         let controller = LoginViewController()
         _self.navigationController?.pushViewController(controller, animated: true)
         }
         */
        }
    }
}

extension ProfileViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
