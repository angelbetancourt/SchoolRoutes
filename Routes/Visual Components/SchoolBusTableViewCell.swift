//
//  SchoolBusTableViewCell.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import UIKit
import AlamofireImage

class SchoolBusTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SchoolBusTableViewCell"
    
    
    @IBOutlet weak var busImageView: UIImageView!
    @IBOutlet weak var busNameLabel: UILabel!
    @IBOutlet weak var busDescriptionLabel: UILabel!
    
    
    func fillWithBus(_ bus: SchoolBus){
        
        busNameLabel.text = bus.name
        busDescriptionLabel.text =  bus.description
        
        
        if let busImageUrlString = bus.imageUrl, let busImageUrl = URL(string: busImageUrlString){
            busImageView.af_setImage(withURL: busImageUrl)
        }
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        busNameLabel.text = nil
        busDescriptionLabel.text = nil
        busImageView.image = nil
    }
        
}
