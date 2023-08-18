//
//  RestaurantDetailsViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 12/06/23.
//

import UIKit
import ComponentUI

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageController: UIPageControl!
    @IBOutlet weak var overviewTitleLabel: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet var buttonsView: [UIView]!
    @IBOutlet var buttonTitleLables: [UILabel]!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var bookTableView: UIView!
    @IBOutlet weak var bookTableButton: UIButton!
    @IBOutlet var subTitlesLables: [UILabel]!
    @IBOutlet weak var viewGalleryButton: UIButton!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var reviewsTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewAllReviewsButtonLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var socialMediaCollectionView: UICollectionView!
    @IBOutlet weak var tagLineLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    let reviewListArray = [ReviewDataModel(image: "userReviews", title: "Shivangi Dwivedi", description: "The concept of deinin is a family restaurant of indian cusine special mediterranean recipes.The concept of deinin is a family restaurant of indian ", rating: "4.5", likedCount: "9", date: "18/8/2021", peopleCount: "9"),
                           ReviewDataModel(image: "userReviews", title: "Mansi Pandey", description: "The concept of deinin is a family restaurant of indian cusine special mediterranean recipes.The concept of deinin is a family restaurant of indian ", rating: "4.5", likedCount: "49", date: "11/12/2022", peopleCount: "49")]
    
    let galleryListArray = [NotificationDataModel(image: "image_00", title: "Great food", description: ""),
                            NotificationDataModel(image: "image_01", title: "Interior Architecture", description: ""),
                            NotificationDataModel(image: "image_02", title: "Happy cusine", description: ""),
                            NotificationDataModel(image: "image_00", title: "Interior Architecture", description: ""),]
    let bannerListArray = [UIImage(named: "image_00"),
                           UIImage(named: "image_01"),
                           UIImage(named: "image_02"),
                           UIImage(named: "image_03"),
                           UIImage(named: "image_04"),
                           UIImage(named: "image_05"),
                           UIImage(named: "image_06"),
                           UIImage(named: "image_07"),
                           UIImage(named: "image_08")]
    
    let socialMediaImagesListArray = [UIImage(named: "google play"),
                                      UIImage(named: "insta"),
                                      UIImage(named: "fb"),
                                      UIImage(named: "watsapp")]
    
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
        reviewsTableViewHeightConstraint.constant = CGFloat(reviewListArray.count * 200)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        bannerCollectionView.collectionViewLayout.invalidateLayout()
        galleryCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndTableViewDelegates()
        autoScrollBannerColletionView()
    }
    
    func setupUI() {
        
        overviewTitleLabel.showStyle(with: .content, weight: .medium)
        descriptionLable.showStyle(with: .small, color: styleLibrary.subHeadingOrContent)
        addressLabel.showStyle(with: .content, weight: .medium, color: styleLibrary.subHeadingOrContent)
        contactNumberLabel.showStyle(with: .content, weight: .medium, color: styleLibrary.subHeadingOrContent)
        websiteLabel.showStyle(with: .content, weight: .medium, color: styleLibrary.subHeadingOrContent)
        emailIdLabel.showStyle(with: .content, weight: .medium, color: styleLibrary.subHeadingOrContent)
        
        for title in subTitlesLables {
            title.showStyle(with: .content, weight: .medium)
        }
        
        for title in buttonTitleLables {
            title.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        }
        for button in buttonsView {
            button.layer.cornerRadius = button.layer.frame.size.height / 2
            button.layer.borderWidth = 1
            button.layer.borderColor = styleLibrary.appColor.cgColor
        }
        
        bookTableView.layer.cornerRadius = bookTableView.layer.frame.size.height / 2
        bookTableView.layer.borderWidth = 1
        bookTableView.layer.borderColor = styleLibrary.appColor.cgColor
        bookTableButton.showStyle(with: .content, weight: .bold, textColor: styleLibrary.appColor, bgColor: .white, needCircularCorners: false)
        viewGalleryButton.showStyle(with: .small, weight: .medium, textColor: styleLibrary.appColor, bgColor: nil, needCircularCorners: false)
        viewAllReviewsButtonLabel.showStyle(with: .small, weight: .medium, color: styleLibrary.appColor)
        updateLabel.showStyle(with: .small, weight: .medium, color: styleLibrary.subHeadingOrContent)
        tagLineLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func registerColletionViewCellAndTableViewDelegates(){
        
        bannerCollectionView?.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        bannerCollectionView?.delegate = self
        bannerCollectionView?.dataSource = self
        
        socialMediaCollectionView?.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        socialMediaCollectionView?.delegate = self
        socialMediaCollectionView?.dataSource = self
        
        galleryCollectionView?.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollectionViewCell")
        galleryCollectionView?.delegate = self
        galleryCollectionView?.dataSource = self
        
        reviewsTableView.register(UINib(nibName: "ReviewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewsTableViewCell")
        reviewsTableView?.delegate = self
        reviewsTableView?.dataSource = self
    }
    
    fileprivate func autoScrollBannerColletionView() {
        bannerPageController.numberOfPages = bannerListArray.count
        Timer.scheduledTimer(timeInterval: 3.0, target: self , selector:
                                #selector(startScrolling), userInfo: nil, repeats: true)
    }
    
    @objc func startScrolling() {
        if bannerPageController.currentPage == bannerPageController.numberOfPages - 1 {
            bannerPageController.currentPage = 0
        } else {
            bannerPageController.currentPage += 1
        }
        bannerCollectionView.scrollToItem(at: IndexPath(row: bannerPageController.currentPage, section: 0), at: .right, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
    }
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func callButtonTapped(_ sender: UIButton) {
    }
    @IBAction func websiteVisitButtonTapped(_ sender: UIButton) {
    }
    @IBAction func emailVisitButtonTapped(_ sender: UIButton) {
    }
    @IBAction func bookTableButtonTapped(_ sender: UIButton) {
    }
    @IBAction func viewGalleryButtonTapped(_ sender: UIButton) {
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
    }
    @IBAction func viewAllReviewsButtonTapped(_ sender: UIButton) {
    }
}

extension RestaurantDetailsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == galleryCollectionView {
            return galleryListArray.count
        } else if collectionView == socialMediaCollectionView {
            return socialMediaImagesListArray.count
        } else {
            return bannerListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == galleryCollectionView {
            if let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as? GalleryCollectionViewCell {
                cell.configureCell(model: galleryListArray[indexPath.row])
                return cell
            }
        } else if collectionView == socialMediaCollectionView {
            if let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
                cell.comingFrom = "Details"
                cell.configureCell(imageName: socialMediaImagesListArray[indexPath.row] ?? UIImage())
                return cell
            }
        } else {
            if let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
                cell.comingFrom = "Details"
                cell.configureCell(imageName: bannerListArray[indexPath.row] ?? UIImage())
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension RestaurantDetailsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            if collectionView == galleryCollectionView {
                let category = galleryListArray[indexPath.row].title
                print(category ?? "")
            } else if collectionView == socialMediaCollectionView {
                let category = galleryListArray[indexPath.row].title
                print(category ?? "")
            } else {
                print(indexPath)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension RestaurantDetailsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == galleryCollectionView {
            return CGSize(width: (((collectionView.frame.width) - 10) / 2.2), height: 200)
        } else if collectionView == socialMediaCollectionView {
            return CGSize(width: 40, height: 40)
        } else {
            if Device.isPhone {
                return CGSize(width: (collectionView.frame.width), height: 250)
            } else {
                return CGSize(width: (collectionView.frame.width), height: 400)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == socialMediaCollectionView{
            return 10
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == socialMediaCollectionView{
            return 10
        }
        return 5
    }
}


extension RestaurantDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as? ReviewsTableViewCell {
            cell.configureCell(model: reviewListArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension RestaurantDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
