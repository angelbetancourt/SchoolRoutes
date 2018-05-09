//
//  SchoolBusStop+MapKit.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import Foundation
import MapKit

extension SchoolBusStop{
    
    func asMKCoordinate() -> CLLocationCoordinate2D{
        
        return  CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        
    }
    func asMKMapItem() -> MKMapItem{
        
        let placemark = MKPlacemark(coordinate: asMKCoordinate(), addressDictionary: nil)
        return MKMapItem(placemark: placemark)
    }
    
    
    func asMKPointAnnotation() -> MKPointAnnotation{
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = asMKCoordinate()
        
        return annotation
    }
}
