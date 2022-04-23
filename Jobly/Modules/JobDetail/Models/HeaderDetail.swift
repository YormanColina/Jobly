//
//  File.swift
//  Jobly
//
//  Created by Apple on 23/04/22.
//

import Foundation
import ObjectMapper

struct HeaderDetail: Mappable {
    var backgroundImage: String = ""
    var title: String = ""
    var tag: String = ""
    
    init?(map: Map) {}
    
    init() {}
    
    mutating func mapping(map: Map) {
        backgroundImage <- map["background_image"]
        title <- map["title"]
        tag <- map["tag"]
    }
    
    
}
