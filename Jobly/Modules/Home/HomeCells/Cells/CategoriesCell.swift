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
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 20
        containerView.layer.cornerRadius = 20
    }
    
    func setupCell(category: Categorie) {
        categoryNameLabel.text = category.title
        imageView.kf.setImage(with: URL(string: category.image))
        containerView.backgroundColor = colorWithHexStringg(hexString: category.color)
        reloadInputViews()
    }
    
    func colorWithHexStringg (hexString:String) -> UIColor {
        var rgb: UInt32 = 0
        let scanner: Scanner = Scanner(string: hexString as String)
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgb)
        
        return UIColor(
          red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
          green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
          blue: CGFloat(rgb & 0x0000FF) / 255.0,
          alpha: CGFloat(1.0)
        )
        return .clear
    }

}
