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
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var headerFooterView: UIView!
    @IBOutlet weak var safeAreaHeightBottom: NSLayoutConstraint!
    @IBOutlet weak var bottomTitleConstraint: NSLayoutConstraint!
    
    //MARK: Properties
    
    private var controller: JobDetailControlable? = JobDetailController()
    private var id: String = ""
    private var job: Job
    
    //MARK: Initializers
    
    init(job: Job) {
        self.job = job
        self.id = job.id
        super.init(nibName: "JobDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomView.transform = CGAffineTransform(translationX: 0, y: self.bottomView.bounds.height + safeAreaHeightBottom.constant)
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
        navigationItem.leftBarButtonItem = customizingNavigationBar(image: UIImage(named: "arrow")!, imageWidth: 20, imageHeight: 20, completion: {
            dismissViewController()
        })
        navigationItem.rightBarButtonItem = customizingNavigationBar(image: UIImage(named: "saveJob")!, imageWidth: 18, imageHeight: 20, completion: {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        })
        setupUI()
        setupTransparentNagigatioNBar()
        configuratedUI()
        safeAreaHeightBottom.constant += UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        collectionView.contentInset = UIEdgeInsets(top: 270, left: 0, bottom: safeAreaHeightBottom.constant, right: 0)
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
        titleWork?.text = job.title
        workImage?.kf.setImage(with: URL(string: job.image))
        
        blurImage.layer.masksToBounds = true
        titleWork.textColor = .white
        blurImage.alpha = 0.4
       
        headerFooterView.layer.cornerRadius = 20
        
        bottomView.layer.cornerRadius = 35
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -6)
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOpacity = 0.1
        
        applyButton.backgroundColor = Colors.primaryColor
        applyButton.titleLabel?.textColor = .white
        applyButton.layer.cornerRadius = 27.5
        applyButton.layer.borderWidth = 2
        applyButton.layer.borderColor = Colors.primaryColor.cgColor
        applyButton.layer.shadowColor = Colors.primaryColor.cgColor
        applyButton.layer.shadowOffset = CGSize(width: 0, height: 7)
        applyButton.layer.shadowOpacity = 0.3
        applyButton.layer.shadowRadius = 7
    }
    
    private func setupUI() {
        controller?.getDetail(id: self.id) {
            self.workImage.kf.setImage(with: URL(string: (self.controller?.jobDetail.header.backgroundImage)!))
            self.typeOfWork.text = "\(self.controller!.jobDetail.header.tag)"
            self.titleWork.text = self.controller?.jobDetail.header.title
            UIView.animate(withDuration: TimeInterval(0.5), delay: TimeInterval(0)) {
                self.bottomView.transform = .identity
            }
            self.collectionView.reloadData()
        }
    }
    
    @objc private func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    private func customizingNavigationBar(image: UIImage, imageWidth: CGFloat, imageHeight: CGFloat, completion: () -> Void) -> UIBarButtonItem {
        
        let buttonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let leftImageView = UIImageView(frame: .zero)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
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
    
    private func takeHeigthOftTitle(text: String, font: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byTruncatingHead
        label.font = UIFont(name: "System", size: font)
        label.sizeToFit()
        let heigth = label.bounds.height
        return heigth
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

// MARK: UICollectionViewDelegateFlowLayout

extension JobDetailViewController: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var  heigth: CGFloat = 0
        
        switch indexPath.section {
        case 0:
            if let description = controller?.jobDetail.body[indexPath.section].content as? Description {
                heigth = takeHeigthOftTitle(text: description.description, font: 18)
                heigth += takeHeigthOftTitle(text: description.salary, font: 14)
                heigth += takeHeigthOftTitle(text: description.location, font: 14)
            }
            return CGSize(width: UIScreen.main.bounds.width, height: heigth + 60)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 90)
        default:
            if let list = controller?.jobDetail.body[indexPath.section].content as? [String] {
                heigth = takeHeigthOftTitle(text: list[indexPath.row], font: 15)
            }
            
            return CGSize(width: UIScreen.main.bounds.width, height: heigth + 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
           return CGSize(width: UIScreen.main.bounds.width, height: 30)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 24)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 80)
        }
    }
}
   

// MARK: UICollectionViewDelegate

extension JobDetailViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let minOffset = -40.0
        let maxOfset = -270.0
        let maxheigtHeader = 370.0
        let minHeigth = 140.0
        let heigthDiferenceOffset = maxheigtHeader - abs(maxOfset)
        let fontDifference: CGFloat = 12.0
        let maxFont: CGFloat = 32.0
        
        
        if offSet <= minOffset && offSet >= maxOfset {
            imageHeigthConstraint.constant = abs(offSet) + heigthDiferenceOffset
        } else if offSet > minOffset {
            imageHeigthConstraint.constant = abs(minOffset) + heigthDiferenceOffset
        } else if offSet <= maxOfset {
            imageHeigthConstraint.constant = abs(offSet) + heigthDiferenceOffset
        }
        
        let proportion = abs((imageHeigthConstraint.constant - maxheigtHeader) / (maxheigtHeader - minHeigth))
        
        
        if imageHeigthConstraint.constant <= maxheigtHeader {
            titleWork.font = titleWork.font.withSize(maxFont - fontDifference * proportion)
        }
    }
}















//(n - min) / (max - min)


//let n1 = imageHeigthConstraint.constant * 20 / 100
//let num = (n1 - 20) / (32 - 20)
//
////        print(n1, "n1")
//print(num, "num")
////        print(percentaje, "porcentaje")
