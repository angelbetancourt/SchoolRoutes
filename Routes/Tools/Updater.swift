//
//  Updater.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

let apiBaseUrl = "https://api.myjson.com/bins"

struct Router{
    
    static let schoolBuses = "/10yg1t"
}

struct Updater {
    
    static func fetchSchoolBuses(_ completion: ((_ buses: [SchoolBus]?, _ error: Error?) -> Void )? ){
        
        let url = apiBaseUrl + Router.schoolBuses
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<SchoolBusesResponse>) in
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.schoolBuses, nil)
                
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    
    
    static func fetchBusStops(_ url: URL, completion: ((_ stops: [SchoolBusStop]?, _ error: Error?) -> Void )? ){
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<SchoolBusStopsResponse>) in
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.schoolBusStops, nil)
                
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
