//
//  Body.swift
//  Jobly
//
//  Created by Apple on 23/04/22.
//

import Foundation
import ObjectMapper

struct Body: Mappable {
    var title: String = ""
    var type: String = ""
    var content: Any = ""
    
    init?(map: Map) {}
    
    init() {}
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        content <- (map["content"], TransformClass(type: type))
    }
    
    
}

struct TransformClass: TransformType {
    var type: String = ""
    
    init(type: String) { self.type = type }
    
    typealias Object = Any

    typealias JSON = [String: Any]
    
    
    func transformFromJSON(_ value: Any?) -> Any? {
        guard let json = value as? JSON else {
            return value
        }
        
        if type == "site" {
            return Mapper<Site>().map(JSON: json)
        } else if type == "description" {
            return Mapper<Description>().map(JSON: json)
            } else {
                return Mapper<List>().map(JSON: json)
            }
    }
    
    func transformToJSON(_ value: Any?) -> [String : Any]? {
        nil
    }
    
}
