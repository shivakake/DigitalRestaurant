//
//  DiscountsViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 09/06/23.
//

import UIKit
import ComponentUI

class DiscountsViewController: UIViewController {
    
    @IBOutlet weak var getDiscountTitleLabel: UILabel!
    @IBOutlet weak var discountsCollectionView: UICollectionView!
    @IBOutlet weak var discountsCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var applyDiscountButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    var discountListArray = [DiscountsListDataModel(discountImage: "userpromo", discountTitle: "New User Promo", discountDetails: "Only valid for new users", isSelected: false),
                             DiscountsListDataModel(discountImage: "discount", discountTitle: "Discount 15% OFF", discountDetails: "15% discount on desserts", isSelected: true),
                             DiscountsListDataModel(discountImage: "userpromo", discountTitle: "Weekend Special", discountDetails: "Valid on sat & sun", isSelected: false)]
    
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
        discountsCollectionViewHeightConstraint.constant = CGFloat(((discountListArray.count) * 100) + 40)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        discountsCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        getDiscountTitleLabel.showStyle(with: .content, weight: .medium)
        applyDiscountButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
    }
    
    func registerColletionViewCellAndDelegate() {
        discountsCollectionView?.register(UINib(nibName: "DiscountCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscountCollectionViewCell")
        discountsCollectionView?.delegate = self
        discountsCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?) {
        for (index, item) in discountListArray.enumerated() {
            discountListArray[index].isSelected = item.discountTitle == category
        }
        discountsCollectionView.reloadCollectionView()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func applyDiscountButtonTapped(_ sender: UIButton) {
    }
}

extension DiscountsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discountListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = discountsCollectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionViewCell", for: indexPath) as? DiscountCollectionViewCell {
            cell.configureCell(model: discountListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension DiscountsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            let category = discountListArray[indexPath.row].discountTitle
            selectedTab(category: category)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension DiscountsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
