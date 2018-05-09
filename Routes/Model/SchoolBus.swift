//
//  SchoolBus.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation
import ObjectMapper

struct SchoolBus: Mappable {
    
    var id = 0
    var name: String?
    var description: String?
    var stops = [SchoolBusStop]()
    var stopsUrl: String?
    var imageUrl: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        id <- map[ApiKeys.SchoolBuses.ScoolBus.id]
        name <- map[ApiKeys.SchoolBuses.ScoolBus.name]
        description <- map[ApiKeys.SchoolBuses.ScoolBus.description]
        stopsUrl <- map[ApiKeys.SchoolBuses.ScoolBus.stopsUrl]
        imageUrl <- map[ApiKeys.SchoolBuses.ScoolBus.imageUrl]
    }
}
