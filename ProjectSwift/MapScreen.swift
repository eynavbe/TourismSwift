//
//  MapScreen.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 31/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapScreen: UIViewController {
    @IBOutlet weak var viewTypes: UIView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    var listAttractions = [Attractions]()
    var listTracks = [Tracks]()
    var listGuidedTours = [GuidedTours]()
    var listFood = [Food]()
    var index: Int?
    @IBAction func mapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //normal
            MapView.mapType = .standard
        case 1:
            //sat
            MapView.mapType = .satellite
        case 2:
            //hybrid
            MapView.mapType = .hybrid

        default:
            break
        }
        
    }
    @IBOutlet weak var MapView: MKMapView!
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("true")
        if keyPath == "select" {
            let select = UserDefaults.standard.data(forKey: "select")
            if  select != nil{
                
            if listAttractions.count > 0 {
                let attractionSelect = try! JSONDecoder().decode(Attractions.self, from: select!)
                
                for annotation: MKAnnotation in MapView.annotations {
                    let anView = MapView.view(for: annotation)
                    if (anView != nil)
                    {
                        if anView?.annotation?.title == attractionSelect.Name{
//                            anView?.image = UIImage(named: "placeholder-3")
                            anView?.setSelected(true, animated: true)
                            mapView(MapView, didSelect: anView!)
                            changeRegion(location: attractionSelect.location)

                        }else{
                            anView?.setSelected(false, animated: true)
                            mapView(MapView, didDeselect: anView!)
//                            anView?.image = UIImage(named: "placeholder-2")
                        }
                        
                    }
                }
                
            }
            if listGuidedTours.count > 0 {
                let guidedToursSelect = try! JSONDecoder().decode(GuidedTours.self, from: select!)
                for annotation: MKAnnotation in MapView.annotations {
                    let anView = MapView.view(for: annotation)
                    if (anView != nil)
                    {
                        if anView?.annotation?.title == guidedToursSelect.Name{
                            anView?.setSelected(true, animated: true)
                            mapView(MapView, didSelect: anView!)
                            changeRegion(location: guidedToursSelect.location)
                        }else{
                            anView?.setSelected(false, animated: true)
                            mapView(MapView, didDeselect: anView!)
                        }
                        
                    }
                }
            }
            if listFood.count > 0 {
                let foodSelect = try! JSONDecoder().decode(Food.self, from: select!)
                for annotation: MKAnnotation in MapView.annotations {
                    let anView = MapView.view(for: annotation)
                    if (anView != nil)
                    {
                        if anView?.annotation?.title == foodSelect.Name{
                            anView?.setSelected(true, animated: true)
                            mapView(MapView, didSelect: anView!)
                            changeRegion(location: foodSelect.location)
                        }else{
                            anView?.setSelected(false, animated: true)
                            mapView(MapView, didDeselect: anView!)
                        }
                        
                    }
                }
            }
            if listTracks.count > 0 {
                let trackSelect = try! JSONDecoder().decode(Tracks.self, from: select!)
                for annotation: MKAnnotation in MapView.annotations {
                    let anView = MapView.view(for: annotation)
                    if (anView != nil)
                    {
                        if anView?.annotation?.title == trackSelect.Name{
                            anView?.setSelected(true, animated: true)
                            mapView(MapView, didSelect: anView!)
                            changeRegion(location: trackSelect.location)
                        }else{
                            anView?.setSelected(false, animated: true)
                            mapView(MapView, didDeselect: anView!)
                        }
                        
                    }
                }
            }
//            UserDefaults.standard.removeObserver(self, forKeyPath: "select")
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.addObserver(self, forKeyPath: "select", options: .new, context: nil)
        checkLocationServices()
        
       if listAttractions.count > 0 {
            if index != nil{
                
                //לעשות זום למיקום
                changeRegion(location: listAttractions[index!].location)
                let cl2d = listAttractions[index!].location.coordinate
                    
                    //להראות מרקר
                let annotation = PlaceAnnotation(title: listAttractions[index!].Name,
                                                 subtitle: listAttractions[index!].Address,
                                                     coordinate: cl2d)
                    MapView.addAnnotation(annotation)
            }else{
                
                //לעשות זום למיקום
                changeRegion(location: listAttractions[0].location)
                for attractions in listAttractions{
                    let cl2d = attractions.location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: attractions.Name,
                                                     subtitle: attractions.Address,
                                                     coordinate: cl2d)
                    MapView.addAnnotation(annotation)
                    
                    
                    
                }
            }
        
        }
        if listGuidedTours.count > 0{
            if index != nil{
                
                //לעשות זום למיקום
                changeRegion(location: listGuidedTours[index!].location)
                
                    let cl2d = listGuidedTours[index!].location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: listGuidedTours[index!].Name,
                                                     subtitle: listGuidedTours[index!].Address,
                                                     coordinate: cl2d)
                    
                    MapView.addAnnotation(annotation)
            }
            else{
                
                //לעשות זום למיקום
                changeRegion(location: listGuidedTours[0].location)
                
                for guidedTours in listGuidedTours{
                    let cl2d = guidedTours.location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: guidedTours.Name,
                                                     subtitle: guidedTours.Address,
                                                     coordinate: cl2d)
                    
                    MapView.addAnnotation(annotation)
                }
            }
           
        }
        if listFood.count > 0{
            if index != nil{
                
                changeRegion(location: listFood[index!].location)
                
                
                    let cl2d = listFood[index!].location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: listFood[index!].Name,
                                                     subtitle: listFood[index!].Address,
                                                     coordinate: cl2d)
                    
                    
                    MapView.addAnnotation(annotation)
            }else{
                
                changeRegion(location: listFood[0].location)
                
                for food in listFood{
                    
                    let cl2d = food.location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: food.Name,
                                                     subtitle: food.Address,
                                                     coordinate: cl2d)
                    
                    
                    MapView.addAnnotation(annotation)
                }
            }
            
        }
        if listTracks.count > 0 {
            if index != nil{
                
                //לעשות זום למיקום
                changeRegion(location: listTracks[index!].location)
                
                
                    let cl2d = listTracks[index!].location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: listTracks[index!].Name,
                                                     subtitle: listTracks[index!].Address,
                                                     coordinate: cl2d)
                    
                    MapView.addAnnotation(annotation)
                    //               MapView.deselectAnnotation(annotation, animated: false)
            }else
            {
                
                //לעשות זום למיקום
                changeRegion(location: listTracks[0].location)
                
                for track in listTracks{
                    
                    let cl2d = track.location.coordinate
                    
                    //להראות מרקר
                    let annotation = PlaceAnnotation(title: track.Name,
                                                     subtitle: track.Address,
                                                     coordinate: cl2d)
                    
                    MapView.addAnnotation(annotation)
                    //               MapView.deselectAnnotation(annotation, animated: false)
                }
            }
        }
    }
   
    func changeRegion(location: CLLocation){
        let cl2d = location.coordinate
        //לעשות זום למיקום
        let region = MKCoordinateRegion(center: cl2d,
                                        latitudinalMeters: regionInMeters,
                                        longitudinalMeters: regionInMeters)
        
        MapView.setRegion(region, animated: true)
        
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: .HKLocationChanged, object: nil)
//    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func centerViewOnUserLocation(){

    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorizasion()
        }else{
            
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation {return nil}
        

             let pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
            pinView.canShowCallout = true
//            pinView.animatesDrop = true
            pinView.image = UIImage(named: "placeholder-2")
            let calloutButton = UIButton(type: .detailDisclosure)
            pinView.rightCalloutAccessoryView = calloutButton
//            pinView.sizeToFit()
//        }
//        else {
//            pinView!.annotation = annotation
//        }
        
        
        return pinView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "MoreAboutCity", bundle:nil)
            let secondViewController = storyBoard.instantiateViewController(withIdentifier: "oneTypeView") as! OneTypeViewController
            if listAttractions.count > 0{
                for attraction1 in listAttractions{
                    if attraction1.Name == view.annotation?.title{
                        secondViewController.attraction = attraction1
                        OneTypeViewController.listAttractions = listAttractions
                    }
                }
                
            }
            if listFood.count > 0{
                for food1 in listFood{
                    if food1.Name == view.annotation?.title{
                        secondViewController.food = food1
                        OneTypeViewController.listFood = listFood
                    }
                }
            }
            if listTracks.count > 0{
                for tracks1 in listTracks{
                    if tracks1.Name == view.annotation?.title{
                        secondViewController.track = tracks1
                        OneTypeViewController.listTracks = listTracks
                    }
                }
            }
            if listGuidedTours.count > 0{
                for guidedTours1 in listGuidedTours{
                    if guidedTours1.Name == view.annotation?.title{
                        secondViewController.guidedTours = guidedTours1
                        OneTypeViewController.listGuidedTours = listGuidedTours
                    }
                }
            }
            self.present(secondViewController, animated:true, completion:nil)
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view)
        view.image = UIImage(named: "placeholder-3")
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
        }
    }
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = UIImage(named: "placeholder-2")
        
        
    }

   
    func checkLocationAuthorizasion() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            MapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            MapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        @unknown default:
            fatalError()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? DetailsCity
            else {return}

        if listAttractions.count > 0 {
          dest.listAttractions = listAttractions
            dest.type = "אטרקציות"
        }
        if listGuidedTours.count > 0{
            dest.listGuidedTours = listGuidedTours
            dest.type = "סיורים מודרכים"
        }
        if listFood.count > 0{
            dest.listFood = listFood
            dest.type = "אוכל"
        }
        if listTracks.count > 0 {
            
           dest.listTracks = listTracks
            dest.type = "מסלולים"
        }
    }
    
}

extension MapScreen : CLLocationManagerDelegate, MKMapViewDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        MapView.setRegion(region, animated: true)
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorizasion()
    }
    
    
}
