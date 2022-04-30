//
//  SignInViewController.swift
//  Jobly
//
//  Created by Jyferson Colina on 22/03/22.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: Properties
    
    var controller: SignInController = SignInController()
    
    
    init() {
        super.init(nibName: "SignInViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @IBAction func presentHome(_ sender: Any) {
        signUpButton.isHidden = true
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        self.progressView.progress = 0.5
        
        controller.presentHome(viewController: self) { success in
            
            guard success else {
                print("Hubo un error en el inicio de sesion")
                self.activitiIndicator.stopAnimating()
                self.activitiIndicator.isHidden = true
                self.signUpButton.isHidden = false
                return
            }
            
            self.progressView.progress = 100
            
            guard let image = self.controller.currentUserImage else {
                return
            }
            
            self.navigationController?.setViewControllers([HomeViewController(imageProfileURL: image)], animated: true)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressView.progress = 0
        signUpButton.layer.cornerRadius = 38
        welcomeView.layer.cornerRadius = 30
        imageView.layer.cornerRadius = 30
        activitiIndicator.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        UIColor.addGradient(view: self.view, leadingColor: Colors.primaryColor , trailingColor: Colors.secondaryColor)
    }
}


