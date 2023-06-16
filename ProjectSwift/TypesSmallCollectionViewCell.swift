//
//  TypesSmallCollectionViewCell.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 31/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import CoreLocation

class TypesSmallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCardTypeSmall: UIView!
    @IBOutlet weak var nameTypeSmall: UILabel!
    @IBOutlet weak var imageTypeSmall: UIImageView!
    @IBOutlet weak var typeOfTypeSmall: UILabel!
    @IBOutlet weak var distanceTypeSmall: UILabel!
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";

    func setSmallAttraction(with attraction: Attractions, myLocation: CLLocation){
        nameTypeSmall?.text = attraction.Name
        viewCardTypeSmall.layer.cornerRadius = 8.0
        viewCardTypeSmall.clipsToBounds = true
        let imageURL = self.imgFolder + attraction.Pic_Url
        imageTypeSmall.sd_setImage(with: URL(string: imageURL))
        typeOfTypeSmall.text = attraction.Attraction_Type
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: attraction.Y, longitude: attraction.X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceTypeSmall.text = distance2
        }else{
            distanceTypeSmall.text = ""
        }
        
    }
    func setSmallTracks(with track: Tracks, myLocation: CLLocation){
        nameTypeSmall?.text = track.Name
        viewCardTypeSmall.layer.cornerRadius = 8.0
        viewCardTypeSmall.clipsToBounds = true
        let imageURL = self.imgFolder + track.Pic_Url
        imageTypeSmall.sd_setImage(with: URL(string: imageURL))
        typeOfTypeSmall.text = track.Trip_Type
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: track.Starting_point_Y, longitude: track.Starting_point_X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceTypeSmall.text = distance2
        }else{
            distanceTypeSmall.text = ""
        }
    }
    func setSmallGuidedTours(with guidedTours: GuidedTours, myLocation: CLLocation){
        nameTypeSmall?.text = guidedTours.Name
        viewCardTypeSmall.layer.cornerRadius = 8.0
        viewCardTypeSmall.clipsToBounds = true
        let imageURL = self.imgFolder + guidedTours.Pic_Url
        imageTypeSmall.sd_setImage(with: URL(string: imageURL))
        typeOfTypeSmall.text = ""
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: guidedTours.Starting_point_Y, longitude: guidedTours.Starting_point_X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceTypeSmall.text = distance2
        }else{
            distanceTypeSmall.text = ""
        }
    }
    func setSmallFood(with food: Food, myLocation: CLLocation){
        nameTypeSmall?.text = food.Name
        viewCardTypeSmall.layer.cornerRadius = 8.0
        viewCardTypeSmall.clipsToBounds = true
        let imageURL = self.imgFolder + food.Pic_Url
        imageTypeSmall.sd_setImage(with: URL(string: imageURL))
        typeOfTypeSmall.text = food.Restaurant_
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: food.Y, longitude: food.X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceTypeSmall.text = distance2
        }else{
            distanceTypeSmall.text = ""
        }
    }
}
