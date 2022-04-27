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
    @IBOutlet weak var footerView: UIView!
    
    var hiddenMoreButton: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupHeader(title: String, isHidden: Bool, type: Any?) {
        titleLabel.text = title
        
        if type is HomeViewController {
            footerView.isHidden = true
        } 
        
        if isHidden {
            moreButton.isHidden = true
            
        }
    }
    
}
