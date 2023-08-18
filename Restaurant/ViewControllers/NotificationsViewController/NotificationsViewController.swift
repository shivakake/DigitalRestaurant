//
//  NotificationsViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var notificationsTitleLabel: UILabel!
    @IBOutlet weak var titleLableWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var notificationsTableView: UITableView!
    
    let notificationListArray = [NotificationDataModel(image: "offer", title: "Best offer for you!", description: "It is long established fact view more..."),
                                 NotificationDataModel(image: "warning", title: "Warning.", description: "Your password is not view more..."),
                                 NotificationDataModel(image: "congratulation", title: "Congratulations!", description: "Success create your view more..."),
                                 NotificationDataModel(image: "uknow", title: "Did you know?", description: "Get your bets offer at view more...")]
    
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
        notificationsTitleLabel.showStyle(with: .content, weight: .medium)
    }
    
    fileprivate func configureTableView() {
        notificationsTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        notificationsTableView.dataSource = self
        notificationsTableView.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
    }
}

extension NotificationsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell {
            cell.configureCell(model: notificationListArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension NotificationsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
