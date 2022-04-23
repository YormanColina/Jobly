//
//  List.swift
//  Jobly
//
//  Created by Apple on 23/04/22.
//

import Foundation
import ObjectMapper

struct List: Mappable {
    var title: String = ""
    var content: [String] = []
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        content <- map["content"]
    }
    
    
}
