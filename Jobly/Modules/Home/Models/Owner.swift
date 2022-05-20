//
//  Owner.swift
//  Jobly
//
//  Created by Jyferson Colina on 29/03/22.
//

import Foundation
import ObjectMapper

struct Owner: Mappable {
    var id: String = ""
    var name: String = ""
    var logo: String = ""
    var data: String = ""
    
    init?(map: Map) {}
    
    init() { }
    
    mutating func mapping(map: Map) {
        id <- map ["id"]
        name <- map ["name"]
        logo <- map ["logo"]
        data <- map ["data"]
    }
}
