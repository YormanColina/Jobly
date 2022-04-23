//
//  WorkDetailController.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import ObjectMapper
import Alamofire

class JobDetailController {
    var jobDetail: JobDetail = JobDetail()
    
    func getDetail(id: String, completion: @escaping () -> Void) {
        print("https://demo9229930.mockable.io/" + id)
        AF.request("https://demo9229930.mockable.io/" + id).responseJSON { response in
            guard let json = response.value as? [String: Any], let detail = Mapper<JobDetail>().map(JSON: json) else {
                return
            }
            
            self.jobDetail = detail
            completion()
            
        }
    }
}


