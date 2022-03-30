//
//  Home.swift
//  Jobly
//
//  Created by Jyferson Colina on 19/03/22.
//

import Foundation
import ObjectMapper

struct Home: Mappable {
    var widgets: [Widget] = []
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        widgets <- map["widgets"]
    }
}
