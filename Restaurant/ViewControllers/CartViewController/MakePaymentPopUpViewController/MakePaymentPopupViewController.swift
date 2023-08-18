//
//  MakePaymentPopupViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 13/06/23.
//

import UIKit
import ComponentUI

class MakePaymentPopupViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var deliveryAddressTitleLabel: UILabel!
    @IBOutlet weak var userDetailsView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAddressOneLabel: UILabel!
    @IBOutlet weak var userAddressTwoLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var editButtonLabel: UILabel!
    @IBOutlet weak var addNewAddressButton: UIButton!
    @IBOutlet weak var paymentDetailsLabel: UILabel!
    @IBOutlet weak var subTotalTitleLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var deliveryFeeTitleLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalIncTaxLabel: UILabel!
    @IBOutlet weak var makePaymentButton: UIButton!
    
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
        popupView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popupView.layer.cornerRadius = 30.0
        deliveryAddressTitleLabel.showStyle(with: .content, weight: .medium)
        userDetailsView.layer.cornerRadius = 10
        userDetailsView.layer.borderWidth = 1
        userDetailsView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        userNameLabel.showStyle(with: .content, weight: .bold, color: styleLibrary.appColor)
        userAddressOneLabel.showStyle(with: .small)
        userAddressTwoLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        mobileNumberLabel.showStyle(with: .small)
        editButtonLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        addNewAddressButton.showStyle(with: .meta, weight: .bold, textColor: styleLibrary.appColor, bgColor: .clear, needCircularCorners: false)
        paymentDetailsLabel.showStyle(with: .small, weight: .semibold)
        subTotalTitleLabel.showStyle(with: .meta)
        subTotalLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        deliveryFeeTitleLabel.showStyle(with: .meta)
        deliveryFeeLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        discountTitleLabel.showStyle(with: .meta, color: .systemGreen)
        discountLabel.showStyle(with: .meta, color: .systemGreen)
        totalAmountTitleLabel.showStyle(with: .small, weight: .semibold)
        totalAmountLabel.showStyle(with: .small, weight: .semibold)
        totalIncTaxLabel.showStyle(with: .meta)
        makePaymentButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userEditButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func addNewAddressButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func makePaymentButtonTapped(_ sender: UIButton) {
        
    }
}
