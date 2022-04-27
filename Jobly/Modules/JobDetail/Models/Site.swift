//
//  Site.swift
//  Jobly
//
//  Created by Apple on 23/04/22.
//

import Foundation
import ObjectMapper

struct Site: Mappable {
    var businessName: String = ""
    var journaly: String = ""
    var image: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        businessName <- map["business_Name"]
        journaly <- map["journaly"]
        image <- map["image"]
    }
}
