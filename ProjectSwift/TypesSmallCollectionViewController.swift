//
//  TypesSmallCollectionViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 31/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import CoreLocation

private let reuseIdentifier = "typeSmallCell"

class TypesSmallCollectionViewController: UICollectionViewController ,CLLocationManagerDelegate {
    var location = CLLocation(latitude: 0.0, longitude: 0.0)
    @IBOutlet var typeSmallCollection: UICollectionView!
    let locationManager = CLLocationManager()
    var myLocation: CLLocation?
    var listAttractions = [Attractions]()
    var listTracks = [Tracks]()
    var listGuidedTours = [GuidedTours]()
    var listFood = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()
        typeSmallCollection?.backgroundColor = UIColor(white: 1, alpha: 0)
        
        let placeDataAttractions = UserDefaults.standard.data(forKey: "listAttractions")
        if  placeDataAttractions != nil{
            let placeArrayAttractions = try! JSONDecoder().decode([Attractions].self, from: placeDataAttractions!)
            if placeArrayAttractions.count > 0{
                listAttractions = placeArrayAttractions
                UserDefaults.standard.set(nil, forKey: "listAttractions")
            }
        }
        
        let placeDataTracks = UserDefaults.standard.data(forKey: "listTracks")
        if placeDataTracks != nil {
            let placeArrayTracks = try! JSONDecoder().decode([Tracks].self, from: placeDataTracks!)
            if placeArrayTracks.count > 0{
                listTracks = placeArrayTracks
                UserDefaults.standard.set(nil, forKey: "listTracks")
            }
        }
        let placeDataFood = UserDefaults.standard.data(forKey: "listFood")
        if placeDataFood != nil {
            let placeArrayFood = try! JSONDecoder().decode([Food].self, from: placeDataFood!)
            if placeArrayFood.count > 0{
                listFood = placeArrayFood
                UserDefaults.standard.set(nil, forKey: "listFood")
            }
        }
        
        let placeDataGuidedTours = UserDefaults.standard.data(forKey: "listGuidedTours")
        if placeDataGuidedTours != nil {
            let placeArrayGuidedTours = try! JSONDecoder().decode([GuidedTours].self, from: placeDataGuidedTours!)
            if placeArrayGuidedTours.count > 0{
                listGuidedTours = placeArrayGuidedTours
                UserDefaults.standard.set(nil, forKey: "listGuidedTours")
            }
        }
        self.typeSmallCollection.reloadData()
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if listAttractions.count > 0 {
            return listAttractions.count
        }
        if listGuidedTours.count > 0 {
            return listGuidedTours.count
        }
        if listFood.count > 0 {
            return listFood.count
        }
        if listTracks.count > 0 {
            return listTracks.count
        }
        return 0
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        myLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TypesSmallCollectionViewCell
        if listAttractions.count > 0 {
            cell.setSmallAttraction(with: listAttractions[indexPath.item], myLocation: myLocation ?? location)
        }
        if listGuidedTours.count > 0 {
            cell.setSmallGuidedTours(with: listGuidedTours[indexPath.item], myLocation: myLocation ?? location)
        }
        if listFood.count > 0 {
            cell.setSmallFood(with: listFood[indexPath.item], myLocation: myLocation ?? location)
        }
        if listTracks.count > 0 {
            cell.setSmallTracks(with: listTracks[indexPath.item], myLocation: myLocation ?? location)
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if listAttractions.count > 0 {
            let attractionsSelect = listAttractions[indexPath.item]
           print(attractionsSelect.Name)
           
            let placesData = try! JSONEncoder().encode(attractionsSelect)
            UserDefaults.standard.set(placesData, forKey: "select")
        }
        if listGuidedTours.count > 0 {
            let guidedToursSelect = listGuidedTours[indexPath.item]
            let placesData = try! JSONEncoder().encode(guidedToursSelect)
            UserDefaults.standard.set(placesData, forKey: "select")
            print(guidedToursSelect.Name)
        }
        if listFood.count > 0 {
            let foodSelect = listFood[indexPath.item]
            let placesData = try! JSONEncoder().encode(foodSelect)
            UserDefaults.standard.set(placesData, forKey: "select")
            print(foodSelect.Name)
        }
        if listTracks.count > 0 {
            let tracksSelect = listTracks[indexPath.item]
            let placesData = try! JSONEncoder().encode(tracksSelect)
            UserDefaults.standard.set(placesData, forKey: "select")
            print(tracksSelect.Name)
        }
    }
    

}
