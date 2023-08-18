//
//  SubmitOTPViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 31/05/23.
//

import UIKit
import ComponentUI

class SubmitOTPViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var otpVerificationTitleLabel: UILabel!
    @IBOutlet weak var otpVerificationTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var weWillSendOTPLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var otpFirstTextField: UITextField!
    @IBOutlet weak var otpSecondTextField: UITextField!
    @IBOutlet weak var otpThirdTextField: UITextField!
    @IBOutlet weak var otpFourthTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var didntReceiveOTPLabel: UILabel!
    @IBOutlet weak var resendOTPButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    var comingFrom = ""
    
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
        otpVerificationTitleLabel.font = Fonts.shared.bold7
        otpFirstTextField.font = Fonts.shared.bold7
        otpSecondTextField.font = Fonts.shared.bold7
        otpThirdTextField.font = Fonts.shared.bold7
        otpFourthTextField.font = Fonts.shared.bold7
        weWillSendOTPLabel.font = Fonts.shared.regular1
        weWillSendOTPLabel.textColor = styleLibrary.subHeadingOrContent
        emailIdLabel.font = Fonts.shared.regular1
        didntReceiveOTPLabel.font = Fonts.shared.regular1
        didntReceiveOTPLabel.textColor = styleLibrary.subHeadingOrContent
        resendOTPButton.titleLabel?.font = Fonts.shared.light1
        resendOTPButton.setTitleColor(styleLibrary.appColor, for: .normal)
        
        if comingFrom != "" {
            weWillSendOTPLabel.text = "Enter the verification code sent to your registered email"
            submitButton.setTitle("Verify OTP", for: .normal)
            topImageView.image = UIImage(named: "7image")
            leftImageView.image = UIImage(named: "1-7")
        }
    }
    
    fileprivate func configureTextFields() {
        otpFirstTextField.delegate = self
        otpSecondTextField.delegate = self
        otpThirdTextField.delegate = self
        otpFourthTextField.delegate = self
    }
    
    private func makeNotificationForOrientationChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(screenRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func screenRotated() {
        if Device.orientation == .portrait {
            leftImageView.isHidden = true
            topImageView.isHidden = false
            if !Device.isPhone {
                otpVerificationTitleTopConstraint.constant = 50
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                otpVerificationTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if comingFrom != "" {
            let controller = NewPasswordViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = HomeViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func resendOTPButtonTapped(_ sender: UIButton) {
    }
    
}

extension SubmitOTPViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
