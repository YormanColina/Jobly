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
    
    init() {
        let fakeCategories = [Categorie(), Categorie(), Categorie(), Categorie()]
        let fakeJobs = [Job(), Job()]
        widgets = [Widget(values: fakeCategories, type: "Categories"), Widget(values: fakeJobs, type: "Jobs")]
    }
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        widgets <- map["widgets"]
    }
}
