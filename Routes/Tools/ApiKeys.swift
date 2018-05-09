//
//  ApiKeys.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation

struct ApiKeys {
    
    static let responseResult = "response" // always present
    
    struct SchoolBuses {
        
        static let schoolBuses = "school_buses"
        
        struct ScoolBus {
            static let id = "id"
            static let name = "name"
            static let description = "description"
            static let stopsUrl = "stops_url"
            static let imageUrl = "img_url"
        }
        
    }
    
    struct SchoolBusStops {
        
        static let schoolBusStops = "stops"
        
        struct SchoolBusStop {
            static let latitude = "lat"
            static let longitude = "lng"
        }
    }
}
