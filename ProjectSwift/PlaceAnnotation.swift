//
//  PlaceAnnotation.swift
//  Lec18SplitVC
//
//  Created by hackeru on 03/07/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import MapKit

class PlaceAnnotation:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    init(title: String? , subtitle:String?,  coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
