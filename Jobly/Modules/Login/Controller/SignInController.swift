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
     let signInConfig = GIDConfiguration.init(clientID: "538780508696-lkdpmv2hgrs6le9675632hkvl3g6q5j7.apps.googleusercontent.com")
    var currentUserImage: URL?
    
    func presentHome(viewController: UIViewController, completion:  @escaping (Bool) -> Void ) {
        // 
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: viewController) { user, error in
            self.currentUserImage = GIDSignIn.sharedInstance.currentUser?.profile?.imageURL(withDimension: 96)
            completion(error == nil)
         }
    }
}
