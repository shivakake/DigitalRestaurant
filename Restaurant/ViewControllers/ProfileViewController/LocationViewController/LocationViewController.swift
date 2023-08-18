//
//  LocationViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import MapKit
import ComponentUI

class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var addressOneLabel: UILabel!
    @IBOutlet weak var addressTwoLabel: UILabel!
    @IBOutlet weak var changeButtonLabel: UILabel!
    @IBOutlet weak var confirmLocationButton: UIButton!
    
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
        locationTitleLabel.showStyle(with: .content, weight: .medium)
        addressOneLabel.showStyle(with: .content)
        addressTwoLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        changeButtonLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        confirmLocationButton.showStyle(with: .content, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func changeLocationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func confirmLocationButtonTapped(_ sender: UIButton) {
    }
}
