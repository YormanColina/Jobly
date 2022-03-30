//
//  HomeController.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import Alamofire
import ObjectMapper
import Alamofire

class HomeController {
    var home: Home = Home()
    
    func configurateHome() {
        AF.request("https://demo4898107.mockable.io/alamofire/testing").responseJSON { response in
            guard let data = response.value as? [String: Any], let home = Mapper<Home>().map(JSON: data) else { return }
           
            self.home = home
        }
        
    }
}
