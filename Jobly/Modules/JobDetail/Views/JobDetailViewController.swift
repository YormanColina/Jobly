//
//  JobDetailViewController.swift
//  Jobly
//
//  Created by Apple on 22/04/22.
//

import UIKit

class JobDetailViewController: UIViewController {
    //MARK: IBOutlets
    var controller: JobDetailController = JobDetailController()
    
    
    //MARK: Properties
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
        setupUI()
    }
    
    //MARK: IBActions
    
    
    //MARK: Methods
    
    func setupUI() {
        controller.getDetail(id: self.id) {
            print("llego mi respuesta")
        }
    }
    
  
    
   
}
