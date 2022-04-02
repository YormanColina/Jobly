//
//  CategoriesCollection.swift
//  Jobly
//
//  Created by Jyferson Colina on 21/03/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    var widgettt: Widget = Widget()
    // MARK: Methods
    
    func setupCollection(widgets: [Widget]) {
        for widget in widgets {
            widgettt = widget
        }
    }
    
    // MARK: IBActions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCell")
        collectionView.register(UINib(nibName: "RecommendedCell", bundle: nil), forCellWithReuseIdentifier: "RecommendedCell")
    }

}

extension CollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if widgettt.type == "Categories" {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell {
                return cell
            }
        }
        
        print(widgettt.type)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as? RecommendedCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

extension CollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 150, height: 150)
        } else {
            return CGSize(width: 310, height: 210)
        }
    }
}

extension CollectionCell: UICollectionViewDelegate {
    
}


