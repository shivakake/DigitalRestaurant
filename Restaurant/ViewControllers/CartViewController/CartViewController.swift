//
//  CartViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 13/06/23.
//

import UIKit
import ComponentUI

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTitleLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var cartListCollectionView: UICollectionView!
    @IBOutlet weak var cartItemsCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addPromoCodeView: UIView!
    @IBOutlet weak var addPromoCodeLabel: UILabel!
    @IBOutlet weak var cartItemsDetailsView: UIView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var subTotalTitleLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var deliveryFeeTitleLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalIncTaxLabel: UILabel!
    @IBOutlet weak var proceedOrderButton: UIButton!
    
    let styleLibrary = StyleLibrary()
    
    var cartItemsListArray = [
        CartListDataModel(image: "image_13", title: "Chacolate Caramel", isDeleted: false, deliveryTime: "1h 20m", calories: "300 cal", price: "$76", quantity: 0),
        CartListDataModel(image: "image_14", title: "Crunchy Donut", isDeleted: false, deliveryTime: "1h 20m", calories: "300 cal", price: "$76", quantity: 0)]
    
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
        cartItemsCollectionViewHeightConstraint.constant = (CGFloat((cartItemsListArray.count) * 150) + 10)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cartListCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        cartTitleLabel.showStyle(with: .content, weight: .medium)
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        addPromoCodeView.layer.cornerRadius = 12
        addPromoCodeView.layer.borderWidth = 1
        addPromoCodeView.layer.borderColor = UIColor.systemGreen.cgColor
        addPromoCodeView.layer.backgroundColor = UIColor.systemGray6.cgColor
        addPromoCodeLabel.showStyle(with: .content)
        cartItemsDetailsView.layer.cornerRadius = 10
        cartItemsDetailsView.layer.borderWidth = 1
        cartItemsDetailsView.layer.borderColor = styleLibrary.subHeadingOrContent.cgColor
        totalItemsLabel.showStyle(with: .small, weight: .semibold)
        subTotalTitleLabel.showStyle(with: .meta)
        subTotalLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        deliveryFeeTitleLabel.showStyle(with: .meta)
        deliveryFeeLabel.showStyle(with: .meta, color: styleLibrary.appColor)
        discountTitleLabel.showStyle(with: .meta, color: .systemGreen)
        discountLabel.showStyle(with: .meta, color: .systemGreen)
        totalAmountTitleLabel.showStyle(with: .small, weight: .semibold)
        totalAmountLabel.showStyle(with: .small, weight: .semibold)
        totalIncTaxLabel.showStyle(with: .meta)
        proceedOrderButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
    }
    
    func registerColletionViewCellAndDelegate() {
        cartListCollectionView?.register(UINib(nibName: "CartListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CartListCollectionViewCell")
        cartListCollectionView?.delegate = self
        cartListCollectionView?.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
    }
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
    }
    @IBAction func addPromoCodeButtonTapped(_ sender: UIButton) {
    }
    @IBAction func proceedOrderButtonTapped(_ sender: UIButton) {
        let controller = MakePaymentPopupViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
}

extension CartViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartItemsListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = cartListCollectionView.dequeueReusableCell(withReuseIdentifier: "CartListCollectionViewCell", for: indexPath) as? CartListCollectionViewCell {
            cell.delegate = self
            cell.minusButton.tag = indexPath.row
            cell.plusButton.tag = indexPath.row
            cell.configureCell(model: cartItemsListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension CartViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            _ = cartItemsListArray[indexPath.row].title
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension CartViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if Device.isPhone {
            return CGSize(width: collectionView.frame.width, height: 150)
        } else {
            return CGSize(width: collectionView.frame.width, height: 170)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension CartViewController :  CartListCollectionViewCellDelegate {
    
    func tappedOnPlus(index: Int) {
        let categoryItem = cartItemsListArray[index]
        if var itemQuantity = categoryItem.quantity {
            if itemQuantity >= 0 {
                itemQuantity += 1
            }
            cartItemsListArray[index].quantity = itemQuantity
            DispatchQueue.main.async {
                self.cartListCollectionView.reloadData()
            }
        }
    }
    
    func tappedOnMinus(index: Int) {
        let categoryItem = cartItemsListArray[index]
        if var itemQuantity = categoryItem.quantity {
            if itemQuantity > 0 {
                itemQuantity -= 1
            }
            cartItemsListArray[index].quantity = itemQuantity
            DispatchQueue.main.async {
                self.cartListCollectionView.reloadData()
            }
        }
    }
}
