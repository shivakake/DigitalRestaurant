//
//  EditProfileViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 07/06/23.
//

import UIKit
import ComponentUI

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changePhotoButton: UIButton!
    @IBOutlet var subTitleLabels: [UILabel]!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var chooseGenderTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var updateProfileButton: UIButton!
    @IBOutlet var editButtonLabel: [UILabel]!
    
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
    
    func commonMethods() {
        setupUI()
    }
    
    fileprivate func setupUI() {
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.size.height / 2
        updateProfileButton.layer.cornerRadius = 10
        profileTitleLabel.showStyle(with: .content, weight: .medium)
        for label in subTitleLabels {
            label.showStyle(with: .meta, color: styleLibrary.appColor)
        }
        for label in editButtonLabel {
            label.showStyle(with: .meta, color: styleLibrary.appColor)
        }
        changePhotoButton.showStyle(with: .content, weight: .semibold, textColor: styleLibrary.appColor, bgColor: .clear, needCircularCorners: false)
        nameTextField.font = Fonts.shared.regular2
        phoneNumberTextField.font = Fonts.shared.regular2
        emailTextField.font = Fonts.shared.regular2
        birthdayTextField.font = Fonts.shared.regular2
        chooseGenderTextField.font = Fonts.shared.regular2
        passwordTextField.font = Fonts.shared.regular2
        updateProfileButton.showStyle(with: .content, weight: .bold, textColor: .white, bgColor: styleLibrary.meta, needCircularCorners: false)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func changePhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func updateProfileButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func editPasswordButtonTapped(_ sender: UIButton) {
        let controller = ChangePasswordPopUpViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
}
