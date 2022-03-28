//
//  HomViewController.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: @IBOutlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var viewHeaderHeight: NSLayoutConstraint!
    @IBOutlet weak var searchYPosition: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    // MARK: Properties
    
    
    // MARK: Initializers
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: IBActions
    
    
    
    // MARK: Methods
    
    func configuredHome() {
        
    }
  
   private func configurateUI() {
        userImage.layer.cornerRadius = 25
       
        notificationButton.layer.cornerRadius = 25
        notificationButton.layer.borderColor = UIColor.lightGray.cgColor
        notificationButton.layer.borderWidth = 0.3
       
        profileButton.layer.cornerRadius = 25
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        profileButton.layer.borderWidth = 0.4
       
       searchView.layer.cornerRadius = 25
       
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    
        navigationController?.isNavigationBarHidden = true
        collectionView.contentInset = UIEdgeInsets(top: 320, left: 0, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "CategoriesCollection", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollection")
        collectionView.register(UINib(nibName: "RecommendedCollection", bundle: nil), forCellWithReuseIdentifier: "RecommendedCollection")
        collectionView.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
}


// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    // Number of Cells in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    
    
    // Cell registration based on its section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollection", for: indexPath) as? CategoriesCollection {
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollection", for: indexPath) as? RecommendedCollection {
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollection", for: indexPath) as? CategoriesCollection {
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    
    // Registration and configuration of the header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as? Header else {
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 0:
            header.setupHeader(title: "Categories", isHidden: false)
            return header
        case 1:
            header.setupHeader(title: "Recommended", isHidden: true)
            return header
        default:
            return header
        }
    }
    
    
    // Number of sections in collection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
}



// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if abs(offsetY) >= 200 {
            // Here the constant of the top of the search engine is progressively modified
            viewHeaderHeight.constant = abs(offsetY)
        }
        if offsetY <= -200 {
            searchYPosition.constant = abs(offsetY) - 70
        }
        
        let num = Float((searchYPosition.constant / 100) / (viewHeaderHeight.constant / 100))
        titleHeader.layer.opacity = num
        
        if searchYPosition.constant <= 285 {
            if searchYPosition.constant <= 235 {
                titleHeader.layer.opacity = 0
            }
        }
  
    }
}



// MARK: UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 120)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 210)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    

}
