//
//  DescriptionViewCell.swift
//  Jobly
//
//  Created by Apple on 26/04/22.
//

import UIKit

class DescriptionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupDescription(description: Description) {
        descriptionLabel.text = description.description
        salaryLabel.text = description.salary
        locationLabel.text = description.location
    }

}
