//
//  PaymentMethodsViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 14/06/23.
//

import UIKit
import ComponentUI

class PaymentMethodsViewController: UIViewController {
    
    @IBOutlet weak var paymentMethodsTitleLabel: UILabel!
    @IBOutlet weak var cardsTableView: UITableView!
    @IBOutlet weak var cardsTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var subTitleLabels: [UILabel]!
    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var addUPIButton: UIButton!
    @IBOutlet weak var upiTableView: UITableView!
    @IBOutlet weak var upiTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addWalletButton: UIButton!
    @IBOutlet weak var walletTableView: UITableView!
    @IBOutlet weak var walletTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addNetbankingButton: UIButton!
    @IBOutlet weak var netbankingTableView: UITableView!
    @IBOutlet weak var netbankingTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addCashOnDeliveryButton: UIButton!
    @IBOutlet weak var freeDelivaryLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    
    let upiListArrya = [PaymentMethodDataModel(image: "gpay", title: "Google Pay"),
                        PaymentMethodDataModel(image: "phonepay", title: "PhonePe"),
                        PaymentMethodDataModel(image: "paytm", title: "Paytm UPI")]
    
    let walletsListArrya = [PaymentMethodDataModel(image: "paytm1", title: "Paytm"),
                            PaymentMethodDataModel(image: "mobikwik", title: "Mobikwik"),
                            PaymentMethodDataModel(image: "phone pay", title: "PhonePe")]
    
    let netbankingListArrya = [PaymentMethodDataModel(image: "hdfc", title: "HDFC Bank"),
                               PaymentMethodDataModel(image: "sbi", title: "State Bank Of India"),
                               PaymentMethodDataModel(image: "icici", title: "ICICI Bank")]
    
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
        upiTableViewHeightConstraint.constant = CGFloat(((upiListArrya.count) * 55))
        walletTableViewHeightConstraint.constant = CGFloat(((walletsListArrya.count) * 55))
        netbankingTableViewHeightConstraint.constant = CGFloat(((netbankingListArrya.count) * 55))
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        cardsTableView.isHidden = true
        for title in subTitleLabels {
            title.showStyle(with: .content, weight: .medium)
        }
        paymentMethodsTitleLabel.showStyle(with: .content, weight: .bold)
        freeDelivaryLabel.showStyle(with: .small)
        cardsTableView.isUserInteractionEnabled = false
        upiTableView.isUserInteractionEnabled = false
        walletTableView.isUserInteractionEnabled = false
        netbankingTableView.isUserInteractionEnabled = false
    }
    
    func registerColletionViewCellAndDelegate(){
        upiTableView.register(UINib(nibName: "PaymentMethodTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodTableViewCell")
        upiTableView?.delegate = self
        upiTableView?.dataSource = self
        
        walletTableView.register(UINib(nibName: "PaymentMethodTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodTableViewCell")
        walletTableView?.delegate = self
        walletTableView?.dataSource = self
        
        netbankingTableView.register(UINib(nibName: "PaymentMethodTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodTableViewCell")
        netbankingTableView?.delegate = self
        netbankingTableView?.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addCardButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addUPIButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addWalletButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addNetbankingButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addCashOnDeliveryButtonTapped(_ sender: UIButton) {
    }
}

extension PaymentMethodsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == upiTableView {
            return upiListArrya.count
        } else if tableView == walletTableView {
            return walletsListArrya.count
        } else {
            return netbankingListArrya.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == upiTableView {
            if let cell = upiTableView.dequeueReusableCell(withIdentifier: "PaymentMethodTableViewCell", for: indexPath) as? PaymentMethodTableViewCell {
                cell.configureCell(model: upiListArrya[indexPath.row])
                //                if indexPath.row == upiListArrya.count - 1 {
                //                    cell.separatorLineLabel.isHidden = true
                //                }
                return cell
            }
        } else if tableView == walletTableView {
            if let cell = walletTableView.dequeueReusableCell(withIdentifier: "PaymentMethodTableViewCell", for: indexPath) as? PaymentMethodTableViewCell {
                cell.configureCell(model: walletsListArrya[indexPath.row])
                return cell
            }
        } else {
            if let cell = netbankingTableView.dequeueReusableCell(withIdentifier: "PaymentMethodTableViewCell", for: indexPath) as? PaymentMethodTableViewCell {
                cell.configureCell(model: netbankingListArrya[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
}
extension PaymentMethodsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == upiTableView {
            
        } else if tableView == walletTableView {
            
        } else {
            
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
