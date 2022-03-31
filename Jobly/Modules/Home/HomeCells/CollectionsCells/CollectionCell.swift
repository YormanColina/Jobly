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
    var completion: (Widget) -> Void
    // MARK: Methods
    
    func setupCollection(widgets: [Widget]) {
        for widget in widgets {
            completion(widget)
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

extension CategoriesCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            self.completion { widget in
                if widget.type ==  "categories" {
                    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell {
                        // Aqui seva a configurar la celda
                        return cell
                    }
                } else if let = widget.type == "jobs" {
                    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as? RecommendedCell {
                        // Aqui seva a configurar la celda
                        return cell
                    }
                }
            }
        return UICollectionViewCell()
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

extension CategoriesCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 150, height: 150)
        } else {
            return CGSize(width: 310, height: 210)
        }
    }
}

extension CategoriesCollection: UICollectionViewDelegate {
    
}


