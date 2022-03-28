//
//  CategoriesCell.swift
//  Jobly
//
//  Created by Jyferson Colina on 21/03/22.
//

import UIKit
import Kingfisher

class CategoriesCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupCell(imageName: String, title: String) {
        categoryNameLabel.text = title
        
    }

}
