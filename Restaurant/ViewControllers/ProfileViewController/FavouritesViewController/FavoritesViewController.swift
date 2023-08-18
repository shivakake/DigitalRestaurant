//
//  FavoritesViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 08/06/23.
//

import UIKit
import ComponentUI

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoriteTitleLabel: UILabel!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    let favoriteListArray = [FevoriteListDataModel(image: "img (1)", title: "Antipasto Salad", liked: true, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 0),
                             FevoriteListDataModel(image: "img (2)", title: "Crunchy Donut", liked: false, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 2),
                             FevoriteListDataModel(image: "img (3)", title: "Chacolate Caramel", liked: true, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 1),
                             FevoriteListDataModel(image: "img (1)", title: "Antipasto Salad", liked: false, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 3),
                             FevoriteListDataModel(image: "img (2)", title: "Chacolate Caramel", liked: true, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 4),
                             FevoriteListDataModel(image: "img (3)", title: "Crunchy Donut", liked: false, foodType: "Italian appetizer", rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        if Device.isPhone {
        //            bannerCollectionViewHeightConstraint.constant = 175
        //        } else {
        //            bannerCollectionViewHeightConstraint.constant = 350
        //        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        favoriteCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        favoriteTitleLabel.showStyle(with: .content, weight: .medium)
    }
    
    func registerColletionViewCellAndDelegate() {
        favoriteCollectionView?.register(UINib(nibName: "FavoritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoritesCollectionViewCell")
        favoriteCollectionView?.delegate = self
        favoriteCollectionView?.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension FavoritesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as? FavoritesCollectionViewCell {
            cell.configureCell(model: favoriteListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FavoritesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
//            let favorite = favoriteListArray[indexPath.row].title
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension FavoritesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if Device.isPhone {
            return CGSize(width: (collectionView.frame.width), height: 250)
        } else {
            return CGSize(width: (collectionView.frame.width), height: 350)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
