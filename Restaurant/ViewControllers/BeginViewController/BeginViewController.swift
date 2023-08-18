//
//  BeginViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 31/05/23.
//

import UIKit
import ComponentUI

class BeginViewController: UIViewController {
    
    @IBOutlet weak var beginTitleLabel: UILabel!
    @IBOutlet weak var beginTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var loginSignupLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var letsStartButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    //    let alerView = alertVi
    
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
        letsStartButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = styleLibrary.appColor.cgColor
        //        beginTitleLabel.showStyle(with: .largeTitle, weight: .bold)
        beginTitleLabel.font = Fonts.shared.bold7
        emailLabel.font = Fonts.shared.regular2
        loginSignupLabel.font = Fonts.shared.regular2
        emailTextField.font = Fonts.shared.regular1
        //        loginSignupLabel.showStyle(with: .content, weight: .semibold, color: styleLibrary.subHeadingOrContent)
        //        emailLabel.showStyle(with: .content, weight: .semibold, color: styleLibrary.subHeadingOrContent)
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
                beginTitleTopConstraint.constant = 100
            }
        } else {
            leftImageView.isHidden = false
            topImageView.isHidden = true
            if !Device.isPhone {
                beginTitleTopConstraint.constant = view.frame.height / 4
            }
        }
    }
    
    @IBAction func letsStartButtonTapped(_ sender: UIButton) {
        guard let emailString = emailTextField.text else { return }
        if emailString.count != 0 {
            print("Navigate to Login")
        } else {
            print("Enter Email Id")
        }
        let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension BeginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
