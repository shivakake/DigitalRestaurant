//
//  GalleryCollectionViewCell.swift
//  Restaurant
//
//  Created by PGK Shiva Kumar on 02/06/23.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    fileprivate func setupCell() {
        galleryImageView.layer.cornerRadius = 5
        imageTitleLabel.showStyle(with: .content, weight: .bold, color: .white)
    }
    
    func configureCell(model: NotificationDataModel?) {
        galleryImageView.image = UIImage(named: model?.image ?? "")
        imageTitleLabel.text = model?.title
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
    }
}
