//
//  RecommendedCell.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
// MARK: IBOutlets
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    // MARK: Properties
    
    // MARK: IBActions
    
    // MARK: Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUi()
    }
    
    func setupUi() {
        viewContainer.layer.cornerRadius = 30
    }

}
