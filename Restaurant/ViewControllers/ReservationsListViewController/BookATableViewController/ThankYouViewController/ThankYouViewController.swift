//
//  ThankYouViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 05/06/23.
//

import UIKit
import ComponentUI

class ThankYouViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var thankyouLabel: UILabel!
    @IBOutlet weak var personsCountLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var reservedTableNumberLabel: UILabel!
    @IBOutlet weak var checkAndRescheduleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
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
        thankyouLabel.showStyle(with: .content, weight: .bold)
        personsCountLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        dateAndTimeLabel.showStyle(with: .meta, weight: .medium)
        reservedTableNumberLabel.showStyle(with: .meta, weight: .medium)
        checkAndRescheduleLabel.showStyle(with: .meta)
        doneButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        popupView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        popupView.layer.cornerRadius = 30.0
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
