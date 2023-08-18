//
//  FilterViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 01/06/23.
//

import UIKit
import ComponentUI

class FilterViewController: UIViewController {
    
    @IBOutlet var subTitleLabels: [UILabel]!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cuisineColletionView: UICollectionView!
    @IBOutlet weak var cuisineCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var costSlider: UISlider!
    @IBOutlet weak var sortCollectionView: UICollectionView!
    @IBOutlet weak var sortCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchButton: UIButton!
    
    var cuisineListArray = [CategoriesDataModel(image: "", title: "All", isSelected: true),
                            CategoriesDataModel(image: "", title: "Dessert", isSelected: false),
                            CategoriesDataModel(image: "", title: "Starter", isSelected: false),
                            CategoriesDataModel(image: "", title: "Main Course", isSelected: false)]
    
    var sortListArray = [CategoriesDataModel(image: "", title: "Distance", isSelected: true),
                         CategoriesDataModel(image: "", title: "Rating", isSelected: false),
                         CategoriesDataModel(image: "", title: "Newest", isSelected: false)]
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                if Device.isPhone {
                    cuisineCollectionViewHeightConstraint.constant = CGFloat(cuisineListArray.count * 40 / 2) + 20
                } else {
                    sortCollectionViewHeightConstraint.constant = 50
                }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cuisineColletionView.collectionViewLayout.invalidateLayout()
        sortCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        for title in subTitleLabels {
            title.showStyle(with: .content, weight: .medium)
        }
        searchButton.showStyle(with: .content, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
    }
    
    func registerColletionViewCellAndDelegate(){
        
        cuisineColletionView?.register(UINib(nibName: "TimeSlotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotsCollectionViewCell")
        cuisineColletionView?.delegate = self
        cuisineColletionView?.dataSource = self
        
        sortCollectionView?.register(UINib(nibName: "TimeSlotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotsCollectionViewCell")
        sortCollectionView?.delegate = self
        sortCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?, collectionView: UICollectionView?) {
        
        if collectionView == cuisineColletionView {
            for (index, item) in cuisineListArray.enumerated() {
                cuisineListArray[index].isSelected = item.title == category
            }
            cuisineColletionView.reloadCollectionView()
        } else {
            for (index, item) in sortListArray.enumerated() {
                sortListArray[index].isSelected = item.title == category
            }
            sortCollectionView.reloadCollectionView()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
    }
}

extension FilterViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cuisineColletionView {
            return cuisineListArray.count
        } else{
            return sortListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cuisineColletionView {
            if let cell = cuisineColletionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotsCollectionViewCell", for: indexPath) as? TimeSlotsCollectionViewCell {
                cell.configureCell(model: cuisineListArray[indexPath.row])
                return cell
            }
        } else {
            if let cell = sortCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotsCollectionViewCell", for: indexPath) as? TimeSlotsCollectionViewCell {
                cell.configureCell(model: sortListArray[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension FilterViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            if collectionView == cuisineColletionView {
                let category = cuisineListArray[indexPath.row].title
                selectedTab(category: category, collectionView: cuisineColletionView)
            } else {
                let sort = sortListArray[indexPath.row].title
                selectedTab(category: sort, collectionView: sortCollectionView)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension FilterViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 10) / 3, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
