//
//  Recommended.swift
//  Jobly
//
//  Created by Jyferson Colina on 29/03/22.
//

import Foundation
import ObjectMapper

struct Job: Mappable {
    var id: String = ""
    var title: String = ""
    var location: String = ""
    var image: String = ""
    var description: String = ""
    var owner: Owner = Owner()
    var isLoader = true
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map ["id"]
        title <- map ["title"]
        location <- map ["location"]
        image <- map ["image"]
        description <- map ["description"]
        owner <- map ["owner"]
        isLoader = false
    }
}
