//
//  ReservationsListCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 05/06/23.
//

import UIKit

class ReservationsListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var deleteCallBack : ((Int) -> Void)?
    var editCallBack : ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        cellBackGroundView.showStyleToView(viewRadius: 10, borderWidth: 1.0, borderColor: .black)
        profileImageView.layer.cornerRadius = 10
        tableNumberLabel.showStyle(with: .content, weight: .semibold)
        dayLabel.showStyle(with: .meta)
        timeLabel.showStyle(with: .meta)
        personsLabel.showStyle(with: .meta)
    }
    
    func configureCell(model: ReservationDataModel?) {
        profileImageView.image = UIImage(named: model?.image ?? "")
        tableNumberLabel.text = model?.title
        dayLabel.text = model?.day
        timeLabel.text = model?.time
        personsLabel.text = model?.persons
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        editCallBack?(sender.tag)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteCallBack?(sender.tag)
    }
}
