//
//  LoginController.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import Alamofire
import ObjectMapper
import GoogleSignIn
import UIKit

class SignInController {
    static let signInConfig = GIDConfiguration.init(clientID: "538780508696-lkdpmv2hgrs6le9675632hkvl3g6q5j7.apps.googleusercontent.com")
    
    func presentHome(viewController: UIViewController, completion:  @escaping (Bool) -> Void ) {
        GIDSignIn.sharedInstance.signIn(with: SignInController.signInConfig, presenting: viewController) { user, error in
           completion(error == nil)
         }
    }
}
