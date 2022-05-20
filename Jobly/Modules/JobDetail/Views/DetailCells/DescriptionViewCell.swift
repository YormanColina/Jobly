//
//  DescriptionViewCell.swift
//  Jobly
//
//  Created by Apple on 26/04/22.
//

import UIKit

class DescriptionViewCell: UICollectionViewCell {

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var footerView: UIView!

    
    func setupDescription(description: Description) {
        let myAtribbuted = NSAttributedString(string: description.location)
        let myString = NSMutableAttributedString("Location:  ")
        let myRange = NSRange(location: 11, length: description.location.count)
        myString.append(myAtribbuted)
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: myRange)
        
        locationLabel.attributedText = myString
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Description: " + description.description
        salaryLabel.text = "Salary:  " + description.salary
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
    }

}
