//
//  ApiResponse.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation
import ObjectMapper


// Common Response implementation
protocol ApiResponse { // POP
    var responseResult: Bool { get set }
}

extension ApiResponse{ // Default protocol implementation
    
    var responseResult: Bool{
        get{
            return false
        }
        set {}
    }
}



// Api School Buses response - parsing - mapping

struct SchoolBusesResponse: ApiResponse, Mappable {
    
    var schoolBuses = [SchoolBus]()

    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        schoolBuses <- map[ApiKeys.SchoolBuses.schoolBuses]
        responseResult <- map[ApiKeys.responseResult]
    }
}



// Api Routes response - parsing - mapping

struct SchoolBusStopsResponse: ApiResponse, Mappable {
    
    var schoolBusStops = [SchoolBusStop]()
    var estimatedTimeMiliseconds: Double? //estimated_time_milliseconds
    var retryTimeMiliseconds: Double? //retry_time_milliseconds
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        schoolBusStops <- map[ApiKeys.SchoolBusStops.schoolBusStops]
        responseResult <- map[ApiKeys.responseResult]
    }
}

