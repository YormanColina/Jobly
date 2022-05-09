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
        
        
//        descriptionLabel.frame =  CGRect(x: 0, y: 0, width: descriptionLabel.intrinsicContentSize.width, height: descriptionLabel.intrinsicContentSize.height)
//
//        print(descriptionLabel.frame.height)
    }

}
