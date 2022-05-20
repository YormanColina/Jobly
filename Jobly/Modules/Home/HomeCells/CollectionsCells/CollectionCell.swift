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
    var widget: Widget?
    var section: Int = 0
    var completion: ((Bool, Int) -> Void)?
    
    
    // MARK: Methods
    
    func setupCollection(widgets: [Widget], section: Int) {
        self.widget = widgets[section]
        collectionView.reloadData()
    }
    
    // MARK: IBActions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCell")
        collectionView.register(UINib(nibName: "RecommendedCell", bundle: nil), forCellWithReuseIdentifier: "RecommendedCell")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        widget = nil
    }
}

extension CollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return widget?.values.count ??  0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let categories = widget?.values as? [Categorie] {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell {
                cell.setupCell(category: categories[indexPath.row])
                return cell
            }
            
        } else if let jobs = widget?.values as? [Job] {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as? RecommendedCell {
                cell.setupCell(recommended: jobs[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension CollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let _ = widget?.values as? [Categorie] {
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
            return CGSize(width: 100, height: 130)
        }
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
        return CGSize(width: 310, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension CollectionCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion!(true, indexPath.row)
    }
}

