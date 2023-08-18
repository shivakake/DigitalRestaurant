//
//  ReviewsTableViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit
import ComponentUI

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var likedCountLabel: UILabel!
    @IBOutlet weak var likedImageView: UIImageView!
    
    let styleLibrary = StyleLibrary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupCell() {
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.size.height / 2
        nameLabel.showStyle(with: .content, weight: .semibold)
        reviewLabel.showStyle(with: .small, color: styleLibrary.subHeadingOrContent)
        ratingLabel.showStyle(with: .meta)
        likedCountLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        dateLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
        peopleLabel.showStyle(with: .meta, color: styleLibrary.subHeadingOrContent)
    }
    
    func configureCell(model: ReviewDataModel?) {
        nameLabel.text = model?.title
        profileImageView.image = UIImage(named: model?.image ?? "")
        ratingLabel.text = model?.rating
        if let likeCount = model?.likedCount {
            likedCountLabel.text = "(\(likeCount))"
        }
        reviewLabel.text = model?.description
        dateLabel.text = model?.date
        if let peopleCount = model?.peopleCount {
            peopleLabel.text = "\(peopleCount) people found this helpful"
        }
    }
    
}
