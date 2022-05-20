//
//  Categorie.swift
//  Jobly
//
//  Created by Jyferson Colina on 29/03/22.
//

import Foundation
import ObjectMapper

struct Categorie: Mappable {
    var id: String = ""
    var image: String = ""
    var color: String = ""
    var title: String = ""
    var isLoader: Bool = true
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map ["id"]
        image <- map  ["image"]
        color <- map  ["color"]
        title <- map  ["title"]
        isLoader = false
    }
}
