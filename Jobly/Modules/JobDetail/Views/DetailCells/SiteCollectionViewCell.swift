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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        logoImageView.layer.borderColor = UIColor.gray.cgColor
        logoImageView.layer.borderWidth = 0.4
        logoImageView.layer.cornerRadius = 30
    }
    
    func setupSite(site: Site) {
        logoImageView.kf.setImage(with: URL(string: site.image))
        bussinessLabel.text = site.businessName
        journalyLabel.text = site.journaly
    }

}
