//
//  Widget.swift
//  Jobly
//
//  Created by Jyferson Colina on 29/03/22.
//

import Foundation
import ObjectMapper

struct Widget: Mappable {
    var id: String = ""
    var title: String = ""
    var type: String = ""
    var values: [Any] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map ["id"]
        title <- map ["title"]
        type <- map ["type"]
        values <- map ["values"]
    }
}
