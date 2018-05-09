//
//  SchoolBusStop.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation
import ObjectMapper

struct SchoolBusStop: Mappable {
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        latitude <- map[ApiKeys.SchoolBusStops.SchoolBusStop.latitude]
        longitude <- map[ApiKeys.SchoolBusStops.SchoolBusStop.longitude]
    }
}
