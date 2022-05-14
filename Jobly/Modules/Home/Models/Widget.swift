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
    
    init(values: [Any]?, type: String) {
        guard let values = values else {
            return
        }
        self.values = values
        self.type = type
    }
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map ["id"]
        title <- map ["title"]
        type <- map ["type"]
        values <- (map["values"], TypesClass(type: type))
    }
}


struct TypesClass: TransformType {
    var type: String
    
    init(type: String) { self.type = type }
    
    typealias Object = Any
    
    typealias JSON = [String: Any]
    
    
    func transformFromJSON(_ value: Any?) -> Any? {
        guard let json = value as? JSON else {
            return value
        }
        
        if type == "Categories" {
            return Mapper<Categorie>().map(JSON: json)
        } else {
            return Mapper<Job>().map(JSON: json)
        }
    }
    
    
    func transformToJSON(_ value: Any?) -> [String : Any]? {
        return nil
    }
}
