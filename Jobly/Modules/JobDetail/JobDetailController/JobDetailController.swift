//
//  WorkDetailController.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import ObjectMapper
import Alamofire

protocol JobDetailControlable: AnyObject {
    var jobDetail: JobDetail { get set }
    func getDetail(id: String, completion: @escaping () -> Void)
    var job: Job { get set }
}


class JobDetailController: JobDetailControlable {
    var jobDetail: JobDetail = JobDetail()
    var job: Job = Job()
    
    
    func getDetail(id: String, completion: @escaping () -> Void) {
        AF.request("https://demo9229930.mockable.io/" + id).responseJSON { response in
            guard let json = response.value as? [String: Any], let detail = Mapper<JobDetail>().map(JSON: json) else {
                return
            }
            self.jobDetail = detail
            completion()
            
        }
    }
}


