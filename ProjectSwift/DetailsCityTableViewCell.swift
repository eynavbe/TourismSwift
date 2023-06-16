//
//  DetailsCityTableViewCell.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation

class DetailsCityTableViewCell: UITableViewCell {
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var nameType: UILabel!
    @IBOutlet weak var typeOfType: UILabel!
    @IBOutlet weak var distanceType: UILabel!
    
    
    var link:DetailsCity?
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .red
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    func cellInAttractions(with place: Attractions, myLocation: CLLocation){
        nameType.text = place.Name
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: place.Y, longitude: place.X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceType.text = distance2
        }else{
            distanceType.text = ""
        }
        
        typeOfType.text = place.Attraction_Type
        let imageType1 = self.imgFolder + place.Pic_Url
        imageType.sd_setImage(with: URL(string: imageType1))
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    @objc private func handleMarkAsFavorite(){
        link?.favorite(cell: self)
    }
    func cellInTracks(with place: Tracks, myLocation: CLLocation){
        nameType.text = place.Name
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: place.Starting_point_Y, longitude: place.Starting_point_X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceType.text = distance2
        }else{
            distanceType.text = ""
        }
        
        typeOfType.text = place.Trip_Type
        let imageType1 = self.imgFolder + place.Pic_Url
        imageType.sd_setImage(with: URL(string: imageType1))
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    func cellInGuidedTours(with place: GuidedTours, myLocation: CLLocation){
        nameType.text = place.Name
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: place.Starting_point_Y, longitude: place.Starting_point_X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceType.text = distance2
        }else{
            distanceType.text = ""
        }
        
        typeOfType.text = ""
        let imageType1 = self.imgFolder + place.Pic_Url
        imageType.sd_setImage(with: URL(string: imageType1))
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    func cellInFood(with place: Food, myLocation: CLLocation){
        nameType.text = place.Name
        
        if myLocation.coordinate.latitude != 0.0{
            let placeLocation = CLLocation(latitude: place.Y, longitude: place.X)
            let distance = myLocation.distance(from: placeLocation) / 1000
            let distance2 = String(format: "%.2f KM", distance)
            distanceType.text = distance2
        }else{
            distanceType.text = ""
        }
        
        typeOfType.text = place.Restaurant_
        let imageType1 = self.imgFolder + place.Pic_Url
        imageType.sd_setImage(with: URL(string: imageType1))
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
}
