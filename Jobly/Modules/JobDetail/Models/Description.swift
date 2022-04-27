//
//  Description.swift
//  Jobly
//
//  Created by Apple on 23/04/22.
//

import Foundation
import ObjectMapper

struct Description: Mappable {
    var location: String = ""
    var salary: String = ""
    var description: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        location <- map["location"]
        salary <- map["salary"]
        description <- map["description"]
    }
}
