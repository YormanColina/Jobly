//
//  Header.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit

class Header: UICollectionReusableView {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupHeader(title: String) {
        titleLabel.text = title
    }
    
}
