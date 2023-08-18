//
//  HomeViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet var subTitlesLabels: [UILabel]!
    @IBOutlet weak var categorySeeAllButton: UIButton!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    
    let styleLibrary = StyleLibrary()
    let bannerListArray = [UIImage(named: "image_00"),
                           UIImage(named: "image_01"),
                           UIImage(named: "image_02"),
                           UIImage(named: "image_03"),
                           UIImage(named: "image_04"),
                           UIImage(named: "image_05"),
                           UIImage(named: "image_06"),
                           UIImage(named: "image_07"),
                           UIImage(named: "image_08")]
    
    var categoriesListArray = [CategoriesDataModel(image: "foodicon", title: "All", isSelected: true),
                               CategoriesDataModel(image: "foodicon", title: "Starters", isSelected: false),
                               CategoriesDataModel(image: "foodicon", title: "Dessert", isSelected: false),
                               CategoriesDataModel(image: "image_18", title: "Soups", isSelected: false)]
    
    let recommendedListArray = [RecommendedListDataModel(image: "image_13", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 0),
                                RecommendedListDataModel(image: "image_14", title: "Crunchy Donut", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 2),
                                RecommendedListDataModel(image: "image_15", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 1),
                                RecommendedListDataModel(image: "image_16", title: "Crunchy Donut", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 3),
                                RecommendedListDataModel(image: "image_17", title: "Chacolate Caramel", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 4),
                                RecommendedListDataModel(image: "image_12", title: "Crunchy Donut", liked: true, rating: "4.5", price: "$76", deliveryTime: "40 min", quantity: 5)]
    
    
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
        if Device.isPhone {
            bannerCollectionViewHeightConstraint.constant = 175
        } else {
            bannerCollectionViewHeightConstraint.constant = 350
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        bannerCollectionView.collectionViewLayout.invalidateLayout()
        categoriesCollectionView.collectionViewLayout.invalidateLayout()
        recommendedCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
        autoScrollBannerColletionView()
    }
    
    func setupUI() {
        
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        profileImageView.makeImageCircle(profileImageView, 1.0, .lightGray, Device.isPhone ? 25 : 30)
        titleLabel.showStyle(with: .content, weight: .medium)
        addressLabel.showStyle(with: .meta, weight: .medium, color: styleLibrary.subHeadingOrContent)
        for title in subTitlesLabels {
            title.showStyle(with: .content, weight: .medium)
        }
        categorySeeAllButton.showStyle(with: .small, weight: .medium, textColor: styleLibrary.appColor, bgColor: nil, needCircularCorners: false)
    }
    
    func registerColletionViewCellAndDelegate(){
        
        bannerCollectionView?.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        bannerCollectionView?.delegate = self
        bannerCollectionView?.dataSource = self
        
        categoriesCollectionView?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        categoriesCollectionView?.delegate = self
        categoriesCollectionView?.dataSource = self
        
        recommendedCollectionView?.register(UINib(nibName: "RecommendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecommendedCollectionViewCell")
        recommendedCollectionView?.delegate = self
        recommendedCollectionView?.dataSource = self
    }
    
    fileprivate func autoScrollBannerColletionView() {
        pageController.numberOfPages = bannerListArray.count
        Timer.scheduledTimer(timeInterval: 3.0, target: self , selector:
                                #selector(startScrolling), userInfo: nil, repeats: true)
    }
    
    @objc func startScrolling() {
        if pageController.currentPage == pageController.numberOfPages - 1 {
            pageController.currentPage = 0
        } else {
            pageController.currentPage += 1
        }
        bannerCollectionView.scrollToItem(at: IndexPath(row: pageController.currentPage, section: 0), at: .right, animated: true)
    }
    
    fileprivate func selectedTab(category: String?) {
        for (index, item) in categoriesListArray.enumerated() {
            categoriesListArray[index].isSelected = item.title == category
        }
        categoriesCollectionView.reloadCollectionView()
    }
    
    @IBAction func notificationButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func categorySeeAllButtonTapped(_ sender: UIButton) {
    }
}


extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categoriesListArray.count
        } else if collectionView == recommendedCollectionView {
            return recommendedListArray.count
        } else{
            return bannerListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView {
            if let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
                cell.configureCell(model: categoriesListArray[indexPath.row])
                return cell
            }
        } else if collectionView == recommendedCollectionView{
            if let cell = recommendedCollectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as? RecommendedCollectionViewCell {
                cell.configureCell(model: recommendedListArray[indexPath.row])
                return cell
            }
        } else {
            if let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
                cell.configureCell(imageName: bannerListArray[indexPath.row] ?? UIImage())
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            if collectionView == categoriesCollectionView {
                let category = categoriesListArray[indexPath.row].title
                selectedTab(category: category)
            } else if collectionView == recommendedCollectionView{
                //                let controller = PropertyDetailsViewController()
                //                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                print(indexPath)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 140, height: 60)
        } else if collectionView == recommendedCollectionView {
            if Device.isPhone {
                if Device.orientation == .portrait {
                    return CGSize(width: ((collectionView.frame.width) - 10) / 1.75, height: 250)
                } else {
                    return CGSize(width: ((collectionView.frame.width) - 10) / 2, height: 250)
                }
            } else {
                if Device.orientation == .portrait {
                    return CGSize(width: ((collectionView.frame.width) - 10) / 2.5, height: 250)
                } else {
                    return CGSize(width: ((collectionView.frame.width) - 10) / 3.5, height: 250)
                }
            }
        } else {
            if Device.isPhone {
                return CGSize(width: (collectionView.frame.width), height: 175)
            } else {
                return CGSize(width: (collectionView.frame.width), height: 350)
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
