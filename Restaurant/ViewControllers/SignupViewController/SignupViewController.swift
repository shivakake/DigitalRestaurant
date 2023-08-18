//
//  SignupViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 31/05/23.
//

import UIKit
import ComponentUI

class SignupViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var signupTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupTitleLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordEyeButton: UIButton!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordEyeButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
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
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = styleLibrary.appColor.cgColor
        nameView.layer.cornerRadius = 10
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = styleLibrary.appColor.cgColor
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = styleLibrary.appColor.cgColor
        confirmPasswordView.layer.cornerRadius = 10
        confirmPasswordView.layer.borderWidth = 1
        confirmPasswordView.layer.borderColor = styleLibrary.appColor.cgColor
        signupTitleLabel.font = Fonts.shared.bold7
        nameTextField.font = Fonts.shared.regular1
        emailTextField.font = Fonts.shared.regular1
        passwordTextField.font = Fonts.shared.regular1
        confirmPasswordTextField.font = Fonts.shared.regular1
        alreadyHaveAccountLabel.font = Fonts.shared.regular1
        loginButton.titleLabel?.font = Fonts.shared.light1
        loginButton.setTitleColor(styleLibrary.appColor, for: .normal)
    }
    
    fileprivate func configureTextFields() {
        emailTextField.delegate = self
        nameTextField.delegate = self
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
                signupTitleTopConstraint.constant = 100
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                signupTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    
    @IBAction func passwordEyeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func confirmPasswordEyeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension SignupViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
