//
//  HomViewController.swift
//  Jobly
//
//  Created by Jyferson Colina on 24/03/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    // MARK: @IBOutlets
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var viewHeaderHeight: NSLayoutConstraint!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var perfilButton: UIButton!
    @IBOutlet weak var viewImage: UIView!
    
    // MARK: Properties
    var controller: HomeController = HomeController()
    var currentUserImage: URL?
    
    // MARK: Initializers
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    init(imageProfileURL: URL) {
        super.init(nibName: "HomeViewController", bundle: nil)
        self.currentUserImage = imageProfileURL
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: IBActions
    
    
    @IBAction func presentProfile(_ sender: Any) {
        
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    // MARK: Methods
    
    func configuredHome(profileImage: URL) {
        userImage?.kf.setImage(with: profileImage)
    }
  
    private func configurateUI() {
        
        
        notificationButton.layer.cornerRadius = 25
        notificationButton.layer.borderColor = UIColor.lightGray.cgColor
        notificationButton.layer.borderWidth = 0.2
        
        profileButton.layer.masksToBounds = false
        
        profileButton.layer.cornerRadius = 25
        profileButton.layer.borderColor = UIColor.lightGray.cgColor
        profileButton.layer.borderWidth = 0.1
        
        perfilButton.isHidden = true
        
        searchView.layer.cornerRadius = 25
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search your job...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        searchImage.alpha = 0.6
        userImage.kf.setImage(with: currentUserImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.configurateHome {
            self.collectionView.reloadData()
        }
        
        
        configurateUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    
        navigationController?.isNavigationBarHidden = true
        collectionView.contentInset = UIEdgeInsets(top: 320, left: 0, bottom: 30, right: 0)
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        collectionView.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.borderWidth = 1.0
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.cornerRadius = userImage.bounds.height * 0.5
        userImage.layer.masksToBounds = true
        
        viewImage.backgroundColor = .clear
        viewImage.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        viewImage.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        viewImage.layer.shadowOpacity = 1.0
        viewImage.layer.shadowRadius = 10.0
    }
}


// MARK: UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    // Number of Cells in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell registration based on its section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell {
            
            if controller.home.widgets.count > 0 {
                
                cell.setupCollection(widgets: controller.home.widgets, section: indexPath.section)
                cell.completion = { value, position in
                    if value {
                        if let array = self.controller.home.widgets[indexPath.section].values as? [Job] {
                            if indexPath.section > 0 {
                                self.navigationController?.pushViewController(JobDetailViewController(job: array[position]), animated: true)
                                self.navigationController?.setNavigationBarHidden(false, animated: true)
                            }
                        }
                    }
                }
            }

            return cell
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
            header.setupHeader(title: controller.home.widgets[indexPath.section].title, isHidden: false)
            return header
        default:
            header.setupHeader(title: controller.home.widgets[indexPath.section].title, isHidden: true)
            return header
        }
    }
    
    
    // Number of sections in collection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return controller.home.widgets.count
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch controller.home.widgets[indexPath.section].type {
        case "Categories":
            return CGSize(width: UIScreen.main.bounds.width, height: 132)
        case "Jobs":
            return CGSize(width: UIScreen.main.bounds.width, height: 210)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }

}

// MARK: UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSet = scrollView.contentOffset.y
        let maxOffSet = -367.0
        let minOffset = -210.0
        let hiddenTitle = -325.0
        let minHeigthHeader = 215.0
        let maxHeigthHeader = 367.0
        
        titleHeader.layer.opacity = 1
   
        if offSet >= maxOffSet && offSet <= minOffset {
            viewHeaderHeight.constant = abs(offSet)
            if offSet > hiddenTitle{
                titleHeader.layer.opacity = 0
            }
        } else if offSet > minOffset {
            titleHeader.layer.opacity = 0
            viewHeaderHeight.constant = minHeigthHeader
        } else if offSet <= maxOffSet {
            viewHeaderHeight.constant = maxHeigthHeader
        }
    
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

