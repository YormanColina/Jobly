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
        progressView.progress = 100
        
        controller.presentHome(viewController: self) { success in
            
            guard success else {
                print("Hubo un error en el inicio de sesion")
                self.activitiIndicator.stopAnimating()
                self.activitiIndicator.isHidden = true
                self.signUpButton.isHidden = false
                return
            }
            
            guard let image = self.controller.currentUserImage else {
                return
            }
            
            print(image)
            
            self.navigationController?.setViewControllers([HomeViewController(imageProfileURL: image)], animated: true)
        }
    }
    
    func addGradient(leadingColor: UIColor, trailingColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.type = .axial
        gradient.colors = [leadingColor.cgColor, trailingColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 38
        welcomeView.layer.cornerRadius = 30
        imageView.layer.cornerRadius = 30
        activitiIndicator.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient(leadingColor: Colors.primaryColor , trailingColor: Colors.secondaryColor)
    }
}
