//
//  RecommendedCollection.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit

class RecommendedCollection: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "RecommendedCell", bundle: nil), forCellWithReuseIdentifier: "RecommendedCell")
    }

}

extension RecommendedCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as? RecommendedCell {
            return  cell
        }
        return RecommendedCell()
    }
    
    
}

extension RecommendedCollection: UICollectionViewDelegate {
    
}

extension RecommendedCollection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    
}
