//
//  RecommendedCell.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit
import Kingfisher

class RecommendedCell: UICollectionViewCell {
// MARK: IBOutlets
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: Properties
    
    // MARK: IBActions
    
    // MARK: Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUi()
    }
    
    func setupUi() {
        viewContainer.layer.cornerRadius = 20
        layer.cornerRadius = 20
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.2
        moreButton.layer.cornerRadius = 20
        moreButton.backgroundColor = Colors.primaryColor
    }
    
    func setupCell(recommended: Job) {
        if recommended.isLoader {
            backgroundColor = Colors.superLigthGary
        }
        titleCell.text = recommended.title
        imageView?.kf.setImage(with: URL(string: recommended.image))
        descriptionCell.text = recommended.location
    }
}
