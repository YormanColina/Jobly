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

        let myAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14) ]
        let myString = NSMutableAttributedString(string: site.journaly, attributes: myAttribute )
        let attrString = NSAttributedString(string: " (Journaly)")
        myString.append(attrString)
        logoImageView.kf.setImage(with: URL(string: site.image))
        bussinessLabel.text = site.businessName
        journalyLabel.attributedText = myString
    }
    
    func configutatedCell() {
        
        viewImageContainer.layer.cornerRadius = viewImageContainer.bounds.height / 2
        logoImageView.layer.cornerRadius = 26
        viewImageContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewImageContainer.layer.shadowColor = UIColor.lightGray.cgColor
        viewImageContainer.layer.shadowOpacity = 0.2
        viewImageContainer.layer.shadowRadius = 10
        logoImageView.contentMode = .scaleAspectFit
        
        viewImageContainer.layer.borderWidth = 2
        viewImageContainer.layer.borderColor = UIColor.white.cgColor
    }

}
