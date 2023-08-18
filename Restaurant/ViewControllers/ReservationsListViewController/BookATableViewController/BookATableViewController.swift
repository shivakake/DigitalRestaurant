//
//  BookATableViewController.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 03/06/23.
//

import UIKit
import ComponentUI

class BookATableViewController: UIViewController {
    
    @IBOutlet weak var bookATableTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var bookSelectionColletionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var calenderView: UIView!
    @IBOutlet weak var timeSlotsView: UIView!
    @IBOutlet weak var personsView: UIView!
    @IBOutlet var timeSubTitleLabels: [UILabel]!
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    @IBOutlet var personsSubTitlesLabel: [UILabel]!
    @IBOutlet weak var personsTotalCountLabel: UILabel!
    @IBOutlet weak var adultsCountLabel: UILabel!
    @IBOutlet weak var childrensCountLabel: UILabel!
    
    let styleLibrary = StyleLibrary()
    var bookSelectionListArray = [
        CategoriesDataModel(image: "day", title: "Day", isSelected: true),
        CategoriesDataModel(image: "time1", title: "Time", isSelected: false),
        CategoriesDataModel(image: "person", title: "Persons", isSelected: false)]
    
    var breakfastTimeSlots = [
        CategoriesDataModel(image: "", title: "7:00", isSelected: false),
        CategoriesDataModel(image: "", title: "7:30", isSelected: false),
        CategoriesDataModel(image: "", title: "8:00", isSelected: false),
        CategoriesDataModel(image: "", title: "8:30", isSelected: false),
        CategoriesDataModel(image: "", title: "9:00", isSelected: false),
        CategoriesDataModel(image: "", title: "9:30", isSelected: false),
        CategoriesDataModel(image: "", title: "10:00", isSelected: false),
        CategoriesDataModel(image: "", title: "10:30", isSelected: false),
        CategoriesDataModel(image: "", title: "11:00", isSelected: false),
        CategoriesDataModel(image: "", title: "11:30", isSelected: false)]
    
    var lunchTimeSlots = [
        CategoriesDataModel(image: "", title: "12:00", isSelected: false),
        CategoriesDataModel(image: "", title: "12:30", isSelected: false),
        CategoriesDataModel(image: "", title: "13:00", isSelected: false),
        CategoriesDataModel(image: "", title: "13:30", isSelected: false),
        CategoriesDataModel(image: "", title: "14:00", isSelected: false),
        CategoriesDataModel(image: "", title: "14:30", isSelected: false),
        CategoriesDataModel(image: "", title: "15:00", isSelected: false),
        CategoriesDataModel(image: "", title: "15:30", isSelected: false),
        CategoriesDataModel(image: "", title: "16:00", isSelected: false),
        CategoriesDataModel(image: "", title: "16:30", isSelected: false)]
    
    var dinnerTimeSlots = [
        CategoriesDataModel(image: "", title: "19:00", isSelected: false),
        CategoriesDataModel(image: "", title: "19:30", isSelected: false),
        CategoriesDataModel(image: "", title: "20:00", isSelected: false),
        CategoriesDataModel(image: "", title: "20:30", isSelected: false),
        CategoriesDataModel(image: "", title: "21:00", isSelected: false),
        CategoriesDataModel(image: "", title: "21:30", isSelected: false),
        CategoriesDataModel(image: "", title: "22:00", isSelected: false),
        CategoriesDataModel(image: "", title: "22:30", isSelected: false),
        CategoriesDataModel(image: "", title: "23:00", isSelected: false),
        CategoriesDataModel(image: "", title: "23:30", isSelected: false)]
    
    var selectedData: String?
    var selectedTime: String?
    var adultCount: Int?
    var childCount: Int?
    
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
        bookSelectionColletionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func commonMethods() {
        setupUI()
        registerColletionViewCellAndDelegate()
    }
    
    func setupUI() {
        calenderView.isHidden = false
        personsView.isHidden = true
        timeSlotsView.isHidden = true
        bookATableTitleLabel.showStyle(with: .content, weight: .bold)
        subTitleLabel.showStyle(with: .content, weight: .bold, color: styleLibrary.appColor)
        continueButton.showStyle(with: .subtitle, weight: .bold, textColor: .white, bgColor: styleLibrary.appColor, needCircularCorners: false)
        cancelButton.showStyle(with: .subtitle, textColor: styleLibrary.subHeadingOrContent, needCircularCorners: false)
        for label in timeSubTitleLabels {
            label.showStyle(with: .content, weight: .bold)
        }
        
        for label in personsSubTitlesLabel {
            label.showStyle(with: .content, weight: .medium)
        }
        personsTotalCountLabel.showStyle(with: .content, weight: .medium)
    }
    
    func registerColletionViewCellAndDelegate(){
        
        bookSelectionColletionView?.register(UINib(nibName: "BookingSelectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookingSelectionCollectionViewCell")
        bookSelectionColletionView?.delegate = self
        bookSelectionColletionView?.dataSource = self
        
        breakfastCollectionView?.register(UINib(nibName: "TimeSlotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotsCollectionViewCell")
        breakfastCollectionView?.delegate = self
        breakfastCollectionView?.dataSource = self
        
        lunchCollectionView?.register(UINib(nibName: "TimeSlotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotsCollectionViewCell")
        lunchCollectionView?.delegate = self
        lunchCollectionView?.dataSource = self
        
        dinnerCollectionView?.register(UINib(nibName: "TimeSlotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotsCollectionViewCell")
        dinnerCollectionView?.delegate = self
        dinnerCollectionView?.dataSource = self
    }
    
    fileprivate func selectedTab(category: String?, collectionView: UICollectionView?) {
        
        switch collectionView {
        case breakfastCollectionView:
            for (index, item) in breakfastTimeSlots.enumerated() {
                breakfastTimeSlots[index].isSelected = item.title == category
            }
            breakfastCollectionView.reloadCollectionView()
        case lunchCollectionView:
            for (index, item) in lunchTimeSlots.enumerated() {
                lunchTimeSlots[index].isSelected = item.title == category
            }
            lunchCollectionView.reloadCollectionView()
        case dinnerCollectionView:
            for (index, item) in dinnerTimeSlots.enumerated() {
                dinnerTimeSlots[index].isSelected = item.title == category
            }
            dinnerCollectionView.reloadCollectionView()
        default:
            for (index, item) in bookSelectionListArray.enumerated() {
                bookSelectionListArray[index].isSelected = item.title == category
            }
            if category == "Day" {
                calenderView.isHidden = false
                personsView.isHidden = true
                timeSlotsView.isHidden = true
                continueButton.setTitle("Continue", for: .normal)
            } else if category == "Time" {
                calenderView.isHidden = true
                personsView.isHidden = true
                timeSlotsView.isHidden = false
                continueButton.setTitle("Continue", for: .normal)
            } else {
                calenderView.isHidden = true
                personsView.isHidden = false
                timeSlotsView.isHidden = true
                continueButton.setTitle("Book a table", for: .normal)
            }
            bookSelectionColletionView.reloadCollectionView()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let controller = ThankYouViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func adultMinusButtonTapped(_ sender: UIButton) {
        guard var person = Int(adultsCountLabel?.text ?? "0") else { return }
        if person > 0 {
            person -= 1
        }
        adultCount = person
        updateTotleCountLabel(child: childCount, adult: person)
    }
    
    @IBAction func adultPlusButtonTapped(_ sender: UIButton) {
        guard var person = Int(adultsCountLabel?.text ?? "0") else { return }
        if person >= 0 {
            person += 1
        }
        adultCount = person
        updateTotleCountLabel(child: childCount, adult: person)
    }
    
    @IBAction func childrensMinusButtonTapped(_ sender: UIButton) {
        guard var child = Int(childrensCountLabel?.text ?? "0") else { return }
        if child > 0 {
            child -= 1
        }
        childCount = child
        updateTotleCountLabel(child: child, adult: adultCount)
    }
    
    @IBAction func childrensPlusButtonTapped(_ sender: UIButton) {
        guard var child = Int(childrensCountLabel?.text ?? "0") else { return }
        if child >= 0 {
            child += 1
        }
        childCount = child
        updateTotleCountLabel(child: child, adult: adultCount)
    }
    
    fileprivate func updateTotleCountLabel(child: Int?, adult: Int?) {
        DispatchQueue.main.async {
            if let childCount = child {
                self.childrensCountLabel.text = "\(childCount)"
            }
            if let adultCount = adult {
                self.adultsCountLabel.text = "\(adultCount)"
            }
            self.personsTotalCountLabel.text = "Total: \((self.adultCount ?? 0) + (self.childCount ?? 0))"
        }
    }
}


extension BookATableViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case breakfastCollectionView:
            return breakfastTimeSlots.count
        case lunchCollectionView:
            return lunchTimeSlots.count
        case dinnerCollectionView:
            return dinnerTimeSlots.count
        default:
            return bookSelectionListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case breakfastCollectionView:
            if let cell = breakfastCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotsCollectionViewCell", for: indexPath) as? TimeSlotsCollectionViewCell {
                cell.configureCell(model: breakfastTimeSlots[indexPath.row])
                return cell
            }
        case lunchCollectionView:
            if let cell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotsCollectionViewCell", for: indexPath) as? TimeSlotsCollectionViewCell {
                cell.configureCell(model: lunchTimeSlots[indexPath.row])
                return cell
            }
        case dinnerCollectionView:
            if let cell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotsCollectionViewCell", for: indexPath) as? TimeSlotsCollectionViewCell {
                cell.configureCell(model: dinnerTimeSlots[indexPath.row])
                return cell
            }
        default:
            if let cell = bookSelectionColletionView.dequeueReusableCell(withReuseIdentifier: "BookingSelectionCollectionViewCell", for: indexPath) as? BookingSelectionCollectionViewCell {
                cell.configureCell(model: bookSelectionListArray[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension BookATableViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexpath = indexPath.first else { return }
        if indexpath != -1 {
            switch collectionView {
            case breakfastCollectionView:
                let category = breakfastTimeSlots[indexPath.row].title
                selectedTab(category: category, collectionView: breakfastCollectionView)
            case lunchCollectionView:
                let category = lunchTimeSlots[indexPath.row].title
                selectedTab(category: category, collectionView: lunchCollectionView)
            case dinnerCollectionView:
                let category = dinnerTimeSlots[indexPath.row].title
                selectedTab(category: category, collectionView: dinnerCollectionView)
            default:
                let category = bookSelectionListArray[indexPath.row].title
                selectedTab(category: category, collectionView: bookSelectionColletionView)
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension BookATableViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case breakfastCollectionView, lunchCollectionView, dinnerCollectionView:
            return CGSize(width: (((collectionView.frame.width)) / 5.35), height: 45)
        default:
            return CGSize(width: ((collectionView.frame.width - 10) / 3), height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case breakfastCollectionView, lunchCollectionView, dinnerCollectionView  :
            return 5
        default:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
