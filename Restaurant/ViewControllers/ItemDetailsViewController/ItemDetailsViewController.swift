//
//  ItemDetailsViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 12/06/23.
//

import UIKit
import ComponentUI

class ItemDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDetailsView: UIView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet var subTitleLabels: [UILabel]!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let styleLibrary = StyleLibrary()
    
    var categoriesListArray = [CategoriesDataModel(image: "foodicon", title: "All", isSelected: true),
                               CategoriesDataModel(image: "foodicon", title: "Starters", isSelected: false),
                               CategoriesDataModel(image: "foodicon", title: "Dessert", isSelected: false),
                               CategoriesDataModel(image: "image_18", title: "Soups", isSelected: false)]
    
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
        categoriesCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        detailsTitleLabel.showStyle(with: .content, weight: .medium)
        itemTitleLabel.showStyle(with: .content, weight: .semibold)
        itemTypeLabel.showStyle(with: .small)
        deliveryTimeLabel.showStyle(with: .meta)
        caloriesLabel.showStyle(with: .meta)
        ratingLabel.showStyle(with: .meta)
        itemDescriptionLabel.showStyle(with: .meta)
        itemPriceLabel.showStyle(with: .title, weight: .semibold, color: styleLibrary.appColor)
        itemQuantityLabel.showStyle(with: .small)
        chooseLabel.showStyle(with: .meta)
        addToCartButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        for sub in subTitleLabels {
            sub.showStyle(with: .content, weight: .semibold)
        }
        itemDetailsView.layer.borderWidth = 1
        itemDetailsView.layer.borderColor = styleLibrary.appColor.cgColor
        itemDetailsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        itemDetailsView.layer.cornerRadius = 30.0
        
        itemImageView.layer.cornerRadius = 10
    }
    
    func registerColletionViewCellAndDelegate() {
        
        categoriesCollectionView?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        categoriesCollectionView?.delegate = self
        categoriesCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?) {
        for (index, item) in categoriesListArray.enumerated() {
            categoriesListArray[index].isSelected = item.title == category
        }
        categoriesCollectionView.reloadCollectionView()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        //        let categoryItem = categoryItemsListArray[index]
        //        if var itemQuantity = categoryItem.quantity {
        //            if itemQuantity >= 0 {
        //                itemQuantity += 1
        //            }
        //            categoryItemsListArray[index].quantity = itemQuantity
        //            DispatchQueue.main.async {
        //                self.categoryItemsCollectionView.reloadData()
        //            }
        //        }
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        //        let categoryItem = categoryItemsListArray[index]
        //        if var itemQuantity = categoryItem.quantity {
        //            if itemQuantity > 0 {
        //                itemQuantity -= 1
        //            }
        //            categoryItemsListArray[index].quantity = itemQuantity
        //            DispatchQueue.main.async {
        //                self.categoryItemsCollectionView.reloadData()
        //            }
        //        }
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
    }
}


extension ItemDetailsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            cell.configureCell(model: categoriesListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ItemDetailsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            let category = categoriesListArray[indexPath.row].title
            selectedTab(category: category)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ItemDetailsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
