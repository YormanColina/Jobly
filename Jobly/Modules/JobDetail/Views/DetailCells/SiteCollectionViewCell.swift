//
//  SiteCollectionViewCell.swift
//  Jobly
//
//  Created by Apple on 26/04/22.
//

import UIKit
import Kingfisher

class SiteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var bussinessLabel: UILabel!
    @IBOutlet weak var journalyLabel: UILabel!
    @IBOutlet weak var viewImageContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configutatedCell()
    }
    
    func setupSite(site: Site) {
        logoImageView.kf.setImage(with: URL(string: site.image))
        bussinessLabel.text = site.businessName
        journalyLabel.text = site.journaly
    }
    
    func configutatedCell() {
        logoImageView.layer.borderColor = UIColor.gray.cgColor
        logoImageView.layer.borderWidth = 0.4
        viewImageContainer.layer.cornerRadius = 30
        logoImageView.layer.cornerRadius = 30
        
        viewImageContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewImageContainer.layer.shadowColor = UIColor.gray.cgColor
        viewImageContainer.layer.shadowOpacity = 0.2
    }

}
