//
//  ListCollectionViewCell.swift
//  Jobly
//
//  Created by Apple on 26/04/22.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pointView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupList(list: [String], section: Int) {
        descriptionLabel.text = list[section]
        pointView.layer.cornerRadius = 4
    }

}
