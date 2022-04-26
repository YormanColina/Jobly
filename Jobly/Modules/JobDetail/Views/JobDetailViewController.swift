//
//  JobDetailViewController.swift
//  Jobly
//
//  Created by Apple on 22/04/22.
//

import UIKit

class JobDetailViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var typeOfWork: UILabel!
    @IBOutlet weak var titleWork: UILabel!
    @IBOutlet weak var workImage: UIImageView!
    
    
    //MARK: Properties
    var controller: JobDetailControlable? = JobDetailController()
    var id: String
    
    
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
        collectionView.register(UINib(nibName: "DescriptionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionViewCell")
        collectionView.register(UINib(nibName: "SiteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SiteCollectionViewCell")
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
        collectionView.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.contentInset = UIEdgeInsets(top: 230, left: 0, bottom: 0, right: 0)
        customizingNavigationBar()
        setupUI()
    }
    
    //MARK: IBActions
    
    
    
    
    //MARK: Methods
    
    func setupUI() {
        controller?.getDetail(id: self.id) {
            self.collectionView.reloadData()
            self.workImage.kf.setImage(with: URL(string: (self.controller?.jobDetail.header.backgroundImage)!))
            self.typeOfWork.text = self.controller?.jobDetail.header.tag
            self.titleWork.text = self.controller?.jobDetail.header.title
        }
        
        workImage.layer.cornerRadius = 25
    }
    
    @objc func dismissViewController() {
        print("se oculto")
        navigationController?.popViewController(animated: true)
    }
    
    func customizingNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(dismissViewController))
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let leftImageView = UIImageView(frame: .zero)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        leftImageView.contentMode = .scaleAspectFit
        leftView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        leftView.addSubview(leftImageView)
        leftView.backgroundColor = .gray
        leftView.layer.cornerRadius = 22
        leftImageView.image = UIImage(named: "arrow")
        leftImageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 12).isActive = true
        leftImageView.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 12).isActive = true
        leftBarButtonItem.customView = leftView
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        leftImageView.isUserInteractionEnabled = false
        leftView.isUserInteractionEnabled = false

        
        let rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(dismissViewController))
        let customRightView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        customRightView.backgroundColor = .green
        customRightView.layer.cornerRadius = 22
        rightBarButtonItem.customView = customRightView
        self.navigationItem.rightBarButtonItem = rightBarButtonItem

    }
}
// MARK: UICollectionViewDataSource
extension JobDetailViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.section {
        case 0 :
           cell = registerCell("DescriptionViewCell", indexPath: indexPath)
            guard let descriptioncell = cell as? DescriptionViewCell else {
                return cell
            }
            if let description = controller?.jobDetail.body[indexPath.section].content as? Description {
                descriptioncell.setupDescription(description: description)
            }
            return descriptioncell
        case 1 :
            cell = registerCell("SiteCollectionViewCell", indexPath: indexPath)
            guard let siteCell = cell as? SiteCollectionViewCell else {
                return cell
            }
            if let site = controller?.jobDetail.body[indexPath.section].content as? Site {
                siteCell.setupSite(site: site)
            }
            return siteCell
        default :
            cell = registerCell("ListCollectionViewCell", indexPath: indexPath)
            guard let listCell = cell as? ListCollectionViewCell else {
                return cell
            }
            if let list = controller?.jobDetail.body[indexPath.section].content as? List {
                listCell.setupList(list: list)
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
            guard let list = controller?.jobDetail.body[section].content as? List else {
                return 0
            }
            return list.content.count
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
            header.setupHeader(title: "", isHidden: true)
            return header
        case 1 :
            header.setupHeader(title: "", isHidden: true)
            return header
        default :
            header.setupHeader(title: (controller?.jobDetail.body[indexPath.section].title)!, isHidden: true)
            return header
        }
        
    }
}

// MARK: UICollectionViewDelegate
extension JobDetailViewController: UICollectionViewDelegate {
    
}


// MARK: UICollectionViewDelegateFlowLayout
extension JobDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
           return CGSize(width: UIScreen.main.bounds.width, height: 150)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 120)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
