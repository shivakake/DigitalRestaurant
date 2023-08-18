//
//  OrdersViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import ComponentUI

class OrdersViewController: UIViewController {
    
    @IBOutlet weak var ordersTitleLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var completeView: UIView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var activeOrdersCollectionView: UICollectionView!
    @IBOutlet weak var completedOrdersCollectionView: UICollectionView!
    
    let styleLibrary = StyleLibrary()
    let activeOrdersList = [OrdersListDataModel(orderImage: "1-2", orderTitle: "Antipasto Salad", ordersCount: "2", ordersPrice: "76", isPaid: true)]
    
    let completedOrdersList = [OrdersListDataModel(orderImage: "1-2", orderTitle: "Antipasto Salad", ordersCount: "2", ordersPrice: "76", isPaid: false),
                               OrdersListDataModel(orderImage: "food", orderTitle: "Antipasto Salad", ordersCount: "2", ordersPrice: "76", isPaid: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        activeOrdersCollectionView.collectionViewLayout.invalidateLayout()
        completedOrdersCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        ordersTitleLabel.showStyle(with: .content, weight: .medium)
        separatorView.layer.backgroundColor = styleLibrary.subHeadingOrContent.cgColor
        activeButton.showStyle(with: .content, weight: .bold, textColor: styleLibrary.heading, needCircularCorners: false)
        completeButton.showStyle(with: .content, textColor: styleLibrary.heading, needCircularCorners: false)
        completedOrdersCollectionView.isHidden = true
    }
    
    func registerColletionViewCellAndDelegate(){
        
        activeOrdersCollectionView?.register(UINib(nibName: "OrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrdersCollectionViewCell")
        activeOrdersCollectionView?.delegate = self
        activeOrdersCollectionView?.dataSource = self
        
        completedOrdersCollectionView?.register(UINib(nibName: "OrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrdersCollectionViewCell")
        completedOrdersCollectionView?.delegate = self
        completedOrdersCollectionView?.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func activeButtonTapped(_ sender: UIButton) {
        
        activeView.backgroundColor = styleLibrary.appColor
        completeView.backgroundColor = .lightGray
        
        activeButton.showStyle(with: .content, weight: .bold, textColor: styleLibrary.heading, needCircularCorners: false)
        completeButton.showStyle(with: .content, textColor: styleLibrary.heading, needCircularCorners: false)
        
        activeOrdersCollectionView.isHidden = false
        activeOrdersCollectionView.reloadData()
        completedOrdersCollectionView.isHidden = true
    }
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        
        activeView.backgroundColor = .lightGray
        completeView.backgroundColor = styleLibrary.appColor
        
        completeButton.showStyle(with: .content, weight: .bold, textColor: styleLibrary.heading, needCircularCorners: false)
        activeButton.showStyle(with: .content, textColor: styleLibrary.heading, needCircularCorners: false)
        
        activeOrdersCollectionView.isHidden = true
        completedOrdersCollectionView.isHidden = false
        completedOrdersCollectionView.reloadData()
    }
}

extension OrdersViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == activeOrdersCollectionView {
            return activeOrdersList.count
        } else {
            return completedOrdersList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == activeOrdersCollectionView {
            if let cell = activeOrdersCollectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as? OrdersCollectionViewCell {
                cell.configureCell(model: activeOrdersList[indexPath.row])
                return cell
            }
        } else {
            if let cell = completedOrdersCollectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as? OrdersCollectionViewCell {
                cell.buttonsView.isHidden = true
                cell.configureCell(model: completedOrdersList[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension OrdersViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            if collectionView == activeOrdersCollectionView {
//                let category = activeOrdersList[indexPath.row].orderTitle
                //                selectedTab(category: category)
            } else {
                //                let controller = PropertyDetailsViewController()
                //                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension OrdersViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == activeOrdersCollectionView {
            return CGSize(width: collectionView.frame.size.width, height: 180)
        } else {
            return CGSize(width: collectionView.frame.size.width, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
