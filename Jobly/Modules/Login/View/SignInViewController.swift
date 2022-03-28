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
    
    // MARK: Properties
    
    var controller: LoginController = LoginController()
    
    
    init() {
        super.init(nibName: "SignInViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @IBAction func presentHome(_ sender: Any) {
        controller.presentHome(viewController: self) { success in
            guard success else {
                print("Hubo un error en el inicio de sesion")
                return
            }
            self.navigationController?.setViewControllers([HomeViewController()], animated: true)
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient(leadingColor: Colors.primaryColor , trailingColor: Colors.secondaryColor)
    }
}
