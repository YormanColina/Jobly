//
//  JobDetailViewController.swift
//  Jobly
//
//  Created by Apple on 22/04/22.
//

import UIKit

class JobDetailViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var typeOfWork: UILabel!
    @IBOutlet private weak var titleWork: UILabel!
    @IBOutlet private weak var workImage: UIImageView!
    @IBOutlet private weak var imageHeigthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var labelTopContraint: NSLayoutConstraint!
    @IBOutlet weak var blurImage: UIVisualEffectView!
    @IBOutlet weak var viewHeaderContainer: UIView!
    //MARK: Properties
    private var controller: JobDetailControlable? = JobDetailController()
    private var id: String
    
    //MARK: Initializers
    
    init(id: String) {
        self.id = id
        super.init(nibName: "JobDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
        collectionView.contentInset = UIEdgeInsets(top: 230, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem = customizingNavigationBar(image: UIImage(named: "arrow")!, completion: {
            dismissViewController()
        })
        navigationItem.rightBarButtonItem = customizingNavigationBar(image: UIImage(named: "saveJob")!, completion: {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        })
        setupUI()
        setupTransparentNagigatioNBar()
        configuratedUI()
    }
    
    //MARK: IBActions
    
    
    
    
    //MARK: Methods
    
    private func setupTransparentNagigatioNBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationItem.compactAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.standardAppearance = appearance
    }
    
    private func configuratedUI() {
        workImage.layer.cornerRadius = 25
        blurImage.layer.cornerRadius = 25
        blurImage.layer.masksToBounds = true
        titleWork.textColor = .white
        titleWork.alpha = 2
        blurImage.alpha = 0.4
    }
    
    private func setupUI() {
        controller?.getDetail(id: self.id) {
            self.collectionView.reloadData()
            self.workImage.kf.setImage(with: URL(string: (self.controller?.jobDetail.header.backgroundImage)!))
            self.typeOfWork.text = self.controller?.jobDetail.header.tag
            self.titleWork.text = self.controller?.jobDetail.header.title
        }
    }
    
    @objc private func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    private func customizingNavigationBar(image: UIImage, completion: () -> Void) -> UIBarButtonItem {
        
        let buttonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let leftImageView = UIImageView(frame: .zero)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        leftImageView.contentMode = .scaleAspectFit
        leftView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        let button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = .white
        leftView.addSubview(leftImageView)
        leftView.addSubview(button)
        leftView.layer.cornerRadius = 22
        leftImageView.image = image
        leftImageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 12).isActive = true
        leftImageView.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 12).isActive = true
        button.topAnchor.constraint(equalTo: leftView.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leftView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: leftView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: leftView.bottomAnchor).isActive = true
        buttonItem.customView = leftView

        return buttonItem
    }
    
    
    private func registerCells() {
        // Regiter of cells
        collectionView.register(UINib(nibName: "DescriptionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionViewCell")
        
        collectionView.register(UINib(nibName: "SiteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SiteCollectionViewCell")
        
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
        
        // Register of Header
        collectionView.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
}
// MARK: UICollectionViewDataSource
extension JobDetailViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.section {
        case 0 :
            // Creation of the Description cell
            cell = registerCell("DescriptionViewCell", indexPath: indexPath)
            guard let descriptioncell = cell as? DescriptionViewCell else {
                return cell
            }
            if let description = controller?.jobDetail.body[indexPath.section].content as? Description {
                descriptioncell.setupDescription(description: description)
            }
            return descriptioncell
            
        case 1 :
            // Creation of the Site cell
            cell = registerCell("SiteCollectionViewCell", indexPath: indexPath)
            guard let siteCell = cell as? SiteCollectionViewCell else {
                return cell
            }
            if let site = controller?.jobDetail.body[indexPath.section].content as? Site {
                siteCell.setupSite(site: site)
            }
            return siteCell
            
        default:
            // Creation of the List cell
            cell = registerCell("ListCollectionViewCell", indexPath: indexPath)
            guard let listCell = cell as? ListCollectionViewCell else {
                return cell
            }
            if let list = controller?.jobDetail.body[indexPath.section].content as? [String] {
                listCell.setupList(list: list, section: indexPath.row)
            }
            return listCell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (controller?.jobDetail.body.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            guard let list = controller?.jobDetail.body[section].content as? [String] else {
                return 0
            }
            return list.count 
        }
    }
    
    func registerCell(_ identifier: String, indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? Header else {
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 0 :
            header.setupHeader(title: "", isHidden: true, type: self)
            return header
        case 1 :
            header.setupHeader(title: "", isHidden: true, type: self)
            return header
        default :
            header.setupHeader(title: (controller?.jobDetail.body[indexPath.section].title)!, isHidden: true, type: self)
            return header
        }
        
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension JobDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
           return CGSize(width: UIScreen.main.bounds.width, height: 120)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
           return CGSize(width: UIScreen.main.bounds.width, height: 0)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 0)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 50)
        }
    }
    
}

// MARK: UICollectionViewDelegate

extension JobDetailViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let minHeigth : CGFloat = 90.0
        
        let heigth = scrollView.contentOffset.y
        
        if offSet <= 0 {
            imageHeigthConstraint.constant = abs(heigth) + minHeigth
        }
        
        if offSet >= -100 && offSet < 0 {
            labelTopContraint.constant = abs(offSet) + 50
            typeOfWork.isHidden = true
        }
        
        if offSet <= -100 && offSet < 0 {
            typeOfWork.isHidden = false
        }
    }
}