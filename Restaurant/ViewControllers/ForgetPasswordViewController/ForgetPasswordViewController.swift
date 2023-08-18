//
//  ForgetPasswordViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var forgetPasswordTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var forgetPasswordTitleLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendOTPButton: UIButton!
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
        sendOTPButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        forgetPasswordTitleLabel.font = Fonts.shared.bold7
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = styleLibrary.appColor.cgColor
        emailTextField.font = Fonts.shared.regular1
        loginButton.titleLabel?.font = Fonts.shared.light1
        loginButton.setTitleColor(styleLibrary.subHeadingOrContent, for: .normal)
    }
    
    fileprivate func configureTextFields() {
        emailTextField.delegate = self
    }
    
    private func makeNotificationForOrientationChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(screenRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func screenRotated() {
        if Device.orientation == .portrait {
            leftImageView.isHidden = true
            topImageView.isHidden = false
            if !Device.isPhone {
                forgetPasswordTitleTopConstraint.constant = 50
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                forgetPasswordTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    @IBAction func sendOTPButtonTapped(_ sender: UIButton) {
        let controller = SubmitOTPViewController()
        controller.comingFrom = "ForgetPassword"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension ForgetPasswordViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
