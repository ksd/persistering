//
//  StateController.swift
//  persistering
//
//  Created by ksd on 25/10/2022.
//


// https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php

import UIKit

class StateController {
    
    let defaults = UserDefaults.standard
    
    func saveMe(name: String, image: UIImage) {
        defaults.set(name, forKey: "name")
        defaults.set(image.pngData(), forKey: "image")
    }
    
    init() {
        let name = defaults.value(forKey: "name") as? String ?? "BøfMedMøg"
        let image = UIImage(data: defaults.value(forKey: "image") as! Data) ?? UIImage()
    }

}
