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
    @IBOutlet weak var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupDescription(description: Description) {
        descriptionLabel.text = "Description: " + description.description
        salaryLabel.text = "Salary: " + description.salary
        locationLabel.text = description.location
        
    }

}
