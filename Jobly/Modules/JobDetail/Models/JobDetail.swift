//
//  WorkDetail.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import ObjectMapper

struct JobDetail: Mappable {
    var id: String = ""
    var header: HeaderDetail = HeaderDetail()
    var body: [Body] = []
    
    init() {}
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        header <- map["header"]
        body <- map["body"]
    }
    
    
}




