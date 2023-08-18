//
//  LoginViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 31/05/23.
//

import UIKit
import ComponentUI

class LoginViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var loginTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordEyeButton: UIButton!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
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
        signinButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = styleLibrary.appColor.cgColor
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = styleLibrary.appColor.cgColor
        loginTitleLabel.font = Fonts.shared.bold7
        passwordTextField.font = Fonts.shared.regular1
        emailTextField.font = Fonts.shared.regular1
        rememberMeButton.titleLabel?.font = Fonts.shared.light1
        rememberMeButton.setTitleColor(styleLibrary.subHeadingOrContent, for: .normal)
        forgotPasswordButton.titleLabel?.font = Fonts.shared.light1
        forgotPasswordButton.setTitleColor(styleLibrary.subHeadingOrContent, for: .normal)
        dontHaveAccountLabel.font = Fonts.shared.regular1
        signUpButton.titleLabel?.font = Fonts.shared.light1
        signUpButton.setTitleColor(styleLibrary.subHeadingOrContent, for: .normal)
    }
    
    fileprivate func configureTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func makeNotificationForOrientationChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(screenRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func screenRotated() {
        if Device.orientation == .portrait {
            leftImageView.isHidden = true
            topImageView.isHidden = false
            if !Device.isPhone {
                loginTitleTopConstraint.constant = 100
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                loginTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    
    @IBAction func passwordEyeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func rememberMeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        let controller = ForgetPasswordViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let controller = SignupViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        let controller = SubmitOTPViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
