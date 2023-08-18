//
//  CategoriesViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit
import ComponentUI

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var titleUnderLineWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoryItemsCollectionView: UICollectionView!
    @IBOutlet weak var categoryItemsCollectionViewHeightConstraint: NSLayoutConstraint!
    
    let styleLibrary = StyleLibrary()
    
    var categoriesListArray = [CategoriesDataModel(image: "foodicon", title: "All", isSelected: true),
                               CategoriesDataModel(image: "foodicon", title: "Starters", isSelected: false),
                               CategoriesDataModel(image: "foodicon", title: "Dessert", isSelected: false),
                               CategoriesDataModel(image: "image_18", title: "Soups", isSelected: false)]
    
    var categoryItemsListArray = [RecommendedListDataModel(image: "image_13", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 0),
                                  RecommendedListDataModel(image: "image_14", title: "Crunchy Donut", liked: false, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 2),
                                  RecommendedListDataModel(image: "image_15", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 4),
                                  RecommendedListDataModel(image: "image_16", title: "Crunchy Donut", liked: false, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 1),
                                  RecommendedListDataModel(image: "image_17", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 5),
                                  RecommendedListDataModel(image: "image_12", title: "Crunchy Donut", liked: false, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 6)]
    
    
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
        categoryItemsCollectionViewHeightConstraint.constant = CGFloat((CGFloat(((categoryItemsListArray.count) * 275)) + 40) / 2)
        if let count = menuTitleLabel.text?.count {
            titleUnderLineWidthConstraint.constant = CGFloat((count * 15))
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        categoriesCollectionView.collectionViewLayout.invalidateLayout()
        categoryItemsCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        menuTitleLabel.showStyle(with: .content, weight: .medium)
        categoryTitleLabel.showStyle(with: .content, weight: .medium)
    }
    
    func registerColletionViewCellAndDelegate() {
        
        categoriesCollectionView?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        categoriesCollectionView?.delegate = self
        categoriesCollectionView?.dataSource = self
        
        categoryItemsCollectionView?.register(UINib(nibName: "CategoryItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryItemCollectionViewCell")
        categoryItemsCollectionView?.delegate = self
        categoryItemsCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?) {
        for (index, item) in categoriesListArray.enumerated() {
            categoriesListArray[index].isSelected = item.title == category
        }
        categoriesCollectionView.reloadCollectionView()
    }
    
    @IBAction func notificationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
    }
}

extension CategoriesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categoriesListArray.count
        } else {
            return categoryItemsListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView {
            if let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
                cell.configureCell(model: categoriesListArray[indexPath.row])
                return cell
            }
        } else {
            if let cell = categoryItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCollectionViewCell", for: indexPath) as? CategoryItemCollectionViewCell {
                cell.delegate = self
                cell.minusButton.tag = indexPath.row
                cell.plusButton.tag = indexPath.row
                cell.configureCell(model: categoryItemsListArray[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension CategoriesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            if collectionView == categoriesCollectionView {
                let category = categoriesListArray[indexPath.row].title
                selectedTab(category: category)
            } else {
                //                let controller = PropertyDetailsViewController()
                //                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension CategoriesViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 140, height: 60)
        } else {
            if Device.isPhone {
                return CGSize(width: ((collectionView.frame.width) - 10) / 2, height: 275)
            } else {
                return CGSize(width: ((collectionView.frame.width) - 10) / 3, height: 275)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension CategoriesViewController :  CategoryItemCollectionViewCellDelegate {
    
    func tappedOnPlus(index: Int) {
        
        let categoryItem = categoryItemsListArray[index]
        if var itemQuantity = categoryItem.quantity {
            if itemQuantity >= 0 {
                itemQuantity += 1
            }
            categoryItemsListArray[index].quantity = itemQuantity
            DispatchQueue.main.async {
                self.categoryItemsCollectionView.reloadData()
            }
        }
    }
    
    func tappedOnMinus(index: Int) {
        
        let categoryItem = categoryItemsListArray[index]
        if var itemQuantity = categoryItem.quantity {
            if itemQuantity > 0 {
                itemQuantity -= 1
            }
            categoryItemsListArray[index].quantity = itemQuantity
            DispatchQueue.main.async {
                self.categoryItemsCollectionView.reloadData()
            }
        }
    }
}
