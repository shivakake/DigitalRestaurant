//
//  NewPasswordViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class NewPasswordViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var newPasswordTitleLabel: UILabel!
    @IBOutlet weak var newPasswordTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordEyeButton: UIButton!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordEyeButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func commonMethods() {
        setupUI()
        screenRotated()
        makeNotificationForOrientationChange()
        configureTextFields()
    }
    
    fileprivate func setupUI() {
        submitButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = styleLibrary.appColor.cgColor
        confirmPasswordView.layer.cornerRadius = 10
        confirmPasswordView.layer.borderWidth = 1
        confirmPasswordView.layer.borderColor = styleLibrary.appColor.cgColor
        newPasswordTitleLabel.font = Fonts.shared.bold7
        passwordTextField.font = Fonts.shared.regular1
        confirmPasswordTextField.font = Fonts.shared.regular1
    }
    
    fileprivate func configureTextFields() {
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func makeNotificationForOrientationChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(screenRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func screenRotated() {
        if Device.orientation == .portrait {
            leftImageView.isHidden = true
            topImageView.isHidden = false
            if !Device.isPhone {
                newPasswordTitleTopConstraint.constant = 100
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                newPasswordTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    
    @IBAction func passwordEyeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func confirmPasswordEyeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
}

extension NewPasswordViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
