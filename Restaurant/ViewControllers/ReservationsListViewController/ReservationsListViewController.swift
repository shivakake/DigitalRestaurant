//
//  ReservationsListViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 05/06/23.
//

import UIKit
import ComponentUI

class ReservationsListViewController: UIViewController {
    
    @IBOutlet weak var bookATableTitleLabel: UILabel!
    @IBOutlet weak var reservationsTitleLabel: UILabel!
    @IBOutlet weak var reservationsListCollectionView: UICollectionView!
    
    var reservationListArray = [ReservationDataModel(image: "img", title: "Table No. 7", day: "19 December", time: "14:30 pm", persons: "3 persons"),
                                ReservationDataModel(image: "img1", title: "Table No. 7", day: "19 December", time: "14:30 pm", persons: "3 persons"),
                                ReservationDataModel(image: "img1", title: "Table No. 7", day: "19 December", time: "14:30 pm", persons: "3 persons"),
                                ReservationDataModel(image: "img", title: "Table No. 7", day: "19 December", time: "14:30 pm", persons: "3 persons")]
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reservationsListCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        bookATableTitleLabel.showStyle(with: .content, weight: .bold)
        reservationsTitleLabel.showStyle(with: .content, weight: .bold, color: styleLibrary.appColor)
    }
    
    func registerColletionViewCellAndDelegate(){
        reservationsListCollectionView?.register(UINib(nibName: "ReservationsListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReservationsListCollectionViewCell")
        reservationsListCollectionView?.delegate = self
        reservationsListCollectionView?.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
        let controller = NotificationsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func bookATableButtonTapped(_ sender: UIButton) {
        let controller = BookATableViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ReservationsListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reservationListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = reservationsListCollectionView.dequeueReusableCell(withReuseIdentifier: "ReservationsListCollectionViewCell", for: indexPath) as? ReservationsListCollectionViewCell {
            cell.editButton.tag = indexPath.row
            cell.deleteButton.tag = indexPath.row
            cell.editCallBack = { [weak self] tableIndex in
                guard let _self = self else { return }
                let controller = BookATableViewController()
                _self.navigationController?.pushViewController(controller, animated: true)
            }
            cell.deleteCallBack = { tableIndex in
                print("tableIndex ",tableIndex)
            }
            cell.configureCell(model: reservationListArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ReservationsListViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
//            print(reservationListArray[indexpath].title)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ReservationsListViewController : UICollectionViewDelegateFlowLayout {
    
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
