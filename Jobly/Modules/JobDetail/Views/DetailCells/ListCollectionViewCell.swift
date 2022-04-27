//
//  ListCollectionViewCell.swift
//  Jobly
//
//  Created by Apple on 26/04/22.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupList(list: [String], section: Int) {
        descriptionLabel.text = list[section]
    }

}
