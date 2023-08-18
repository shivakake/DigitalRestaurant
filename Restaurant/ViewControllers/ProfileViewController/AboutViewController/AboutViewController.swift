//
//  AboutViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit
import ComponentUI

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutTitleLabel: UILabel!
    @IBOutlet weak var aboutTableView: UITableView!
    
    let styleLibrary = StyleLibrary()
    let aboutListArray = ["Terms of service", "Open Source Libraries", "Licenses and Registrations", "Queries", "Contact us"]
    
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
        configureTableView()
    }
    
    fileprivate func setupUI() {
        aboutTitleLabel.showStyle(with: .content, weight: .medium)
        aboutTableView.separatorStyle = .none
    }
    
    fileprivate func configureTableView() {
        aboutTableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutTableViewCell")
        aboutTableView.dataSource = self
        aboutTableView.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension AboutViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as? AboutTableViewCell {
            cell.configureCell(title: aboutListArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
extension AboutViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
