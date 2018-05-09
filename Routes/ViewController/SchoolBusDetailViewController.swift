//
//  SchoolBusDetailViewController.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import UIKit
import MapKit

class SchoolBusDetailViewController: UIViewController {

    
    @IBOutlet weak var schoolBusImageView: UIImageView!
    @IBOutlet weak var schoolBusNameLabel: UILabel!
    @IBOutlet weak var schoolBusDescriptionLabel: UILabel!
    @IBOutlet weak var schoolBusStopsMapView: MKMapView!
    
    var schoolBus: SchoolBus?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fill()
    }
    
    func fill(){
        
        guard let schoolBus = schoolBus else { return }
        
        navigationItem.title = schoolBus.name
        schoolBusNameLabel.text = schoolBus.name
        schoolBusDescriptionLabel.text =  schoolBus.description
        if let busImageUrlString = schoolBus.imageUrl, let busImageUrl = URL(string: busImageUrlString){
            schoolBusImageView.af_setImage(withURL: busImageUrl)
        }
        
        
        if schoolBus.stops.isEmpty{
            fetchBusStops(schoolBus)
            
        }else{
            fillMapView()
        }
    }
    
    func fetchBusStops(_ schoolBus: SchoolBus){
        
        guard let stopsUrl = schoolBus.stopsUrl, let url = URL(string: stopsUrl) else { return }
        showActivityIndicator()
        
        Updater.fetchBusStops(url) {[weak self] (stops, error) in
            
            self?.hideActivityIndicator()
            
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.schoolBus?.stops = stops ?? []
            self?.fillMapView()
        }
        
    }

    
    func fillMapView(){
        
        guard let schoolBus = schoolBus else { return }
        guard !schoolBus.stops.isEmpty else { return }
        
        let anotations = schoolBus.stops.map({ return  $0.asMKPointAnnotation() })
        schoolBusStopsMapView.showAnnotations(anotations, animated: true)
        
        
    }
    

}
