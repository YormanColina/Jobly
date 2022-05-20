//
//  Header.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit

class Header: UICollectionReusableView {
    //MARK: @IBOutlet
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Properties
    var hiddenMoreButton: Bool = false
    
    //MARK: Methods
    func setupHeader(title: String, isHidden: Bool) {
        titleLabel.text = title
        
        if isHidden {
            moreButton.isHidden = true
        }
    }
}
