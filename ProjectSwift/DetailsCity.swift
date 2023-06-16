//
//  DetailsCity.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import CoreLocation

class DetailsCity: UIViewController,CLLocationManagerDelegate {
    var type: String?
    @IBOutlet weak var tableType: UITableView!
    let locationManager = CLLocationManager()
    var myLocation: CLLocation?
    @IBOutlet weak var titleItem: UINavigationItem!
    var location = CLLocation(latitude: 0.0, longitude: 0.0)
    @IBOutlet weak var imageTypeMain: UIImageView!
    @IBOutlet weak var viewFiltering: UIView!
    var listAttractions = [Attractions]()
    var listAttractionsFavorites = [FavoritesAttractions]()
    
    var listAttractionsFilter = [FavoritesAttractions]()
    var listTracks = [Tracks]()
    var listTracksFilter = [FavoritesTracks]()
    var listTracksFavorites = [FavoritesTracks]()
    var listGuidedTours = [GuidedTours]()
    var listGuidedToursFilter = [FavoritesGuidedTours]()
    var listGuidedToursFavorites = [FavoritesGuidedTours]()
    var listFood = [Food]()
    var listFoodFilter = [FavoritesFood]()
    var listFoodFavorites = [FavoritesFood]()
    var searching : String?
    var imageFood = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/food.jpg?alt=media&token=36f71205-5f93-46ef-a8c4-90d74f91cac0"
    var imageTracks = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/Tracks.jpg?alt=media&token=d38acf87-cc94-430c-b320-a1c940c4f376"
    var imageGuidedTours = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/guided%20tours.jpg?alt=media&token=d9c86648-ca3b-4443-a445-409c962e858d"
    var imageAttractions = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/attractions.jpg?alt=media&token=06556c42-6a3f-4b50-98bd-dc0f0454af80"
//    @objc func buttonAction(sender: UIButton!) {
//        button.backgroundColor = .green
//    }
    
    
   
//    func checkssssss(searchingBefore : String) {
//        searching = searchingBefore
////        DispatchQueue.main.async {
//            //                    self.pageControlImageCities.numberOfPages = self.imgArrURL.count
//            //                    self.pageControlImageCities.currentPage = 0
//            self.tableType.reloadData()
////        }
//    }
    func favorite(cell: UITableViewCell)  {
         if Auth.auth().currentUser?.uid == nil{
            let alert = UIAlertController(title: "לשמור למועדפים", message: "לא עשית LogIn", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            guard let indexPathTapped = tableType.indexPath(for: cell) else {return}
            switch type {
            case "מסלולים":
                if searching != nil && searching != "הכל"{
                    let name = listTracksFilter[indexPathTapped.row].track.Name
                    for i in 0..<listTracksFavorites.count{
                        if listTracksFavorites[i].track.Name == name{
                            let hasFavorites = listTracksFavorites[i].hasFavorited
                            listTracksFavorites[i].hasFavorited = !hasFavorites
                            listTracksFilter[indexPathTapped.row].hasFavorited = !hasFavorites
                        }
                    }
                }
                else{
                    let tracksFavorite = listTracksFavorites[indexPathTapped.row]
                    print(tracksFavorite)
                    let hasFavorites = tracksFavorite.hasFavorited
                    listTracksFavorites[indexPathTapped.row].hasFavorited = !hasFavorites
                }
            case "אוכל":
                if searching != nil && searching != "הכל" {
                    let name = listFoodFilter[indexPathTapped.row].food.Name
                    for i in 0..<listFoodFavorites.count{
                        if listFoodFavorites[i].food.Name == name{
                            let hasFavorites = listFoodFavorites[i].hasFavorited
                            listFoodFavorites[i].hasFavorited = !hasFavorites
                            listFoodFilter[indexPathTapped.row].hasFavorited = !hasFavorites
                        }
                    }
                }
                else{
                    let foodFavorite = listFoodFavorites[indexPathTapped.row]
                    print(foodFavorite)
                    let hasFavorites = foodFavorite.hasFavorited
                    listFoodFavorites[indexPathTapped.row].hasFavorited = !hasFavorites
                }
            case "סיורים מודרכים":
                if searching != nil && searching != "הכל"{
                    let name = listGuidedToursFilter[indexPathTapped.row].guidedTours.Name
                    for i in 0..<listGuidedToursFavorites.count{
                        if listGuidedToursFavorites[i].guidedTours.Name == name{
                            let hasFavorites = listGuidedToursFavorites[i].hasFavorited
                            listGuidedToursFavorites[i].hasFavorited = !hasFavorites
                            listGuidedToursFilter[indexPathTapped.row].hasFavorited = !hasFavorites
                        }
                    }
                }
                else{
                    let guidedToursFavorite = listGuidedToursFavorites[indexPathTapped.row]
                    print(guidedToursFavorite)
                    let hasFavorites = guidedToursFavorite.hasFavorited
                    listGuidedToursFavorites[indexPathTapped.row].hasFavorited = !hasFavorites
                }
            default:
                if searching != nil && searching != "הכל" {
                    let name = listAttractionsFilter[indexPathTapped.row].attraction.Name
                    for i in 0..<listAttractionsFavorites.count{
                        if listAttractionsFavorites[i].attraction.Name == name{
                            let hasFavorites = listAttractionsFavorites[i].hasFavorited
                            listAttractionsFavorites[i].hasFavorited = !hasFavorites
                            listAttractionsFilter[indexPathTapped.row].hasFavorited = !hasFavorites
                        }
                    }
                }
                else{
                    let attractionsFavorite = listAttractionsFavorites[indexPathTapped.row]
                    print(attractionsFavorite)
                    let hasFavorites = attractionsFavorite.hasFavorited
                    listAttractionsFavorites[indexPathTapped.row].hasFavorited = !hasFavorites

                }

            }
            tableType.reloadRows(at: [indexPathTapped], with: .fade)
         }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "searching" {
            searching = UserDefaults.standard.string(forKey: "searching")
            if searching != nil && searching != "הכל"{
                switch type{
                case "מסלולים":
                    listTracksFilter = listTracksFavorites.filter({(tracks) in
                        return Bool(tracks.track.Region == searching)
                    })
                case "אוכל":
                    listFoodFilter = listFoodFavorites.filter({(food) in
                        var restaurant : String
                        restaurant = food.food.Restaurant_
                        var restaurant2  = restaurant
                        var index = restaurant.firstIndex(of: ";")
                        while index != nil && restaurant != searching{
                            restaurant = String(restaurant2[restaurant2.startIndex..<index!])
                            let range = restaurant2.index(after: index!)..<restaurant2.endIndex
                            restaurant2 = String( restaurant2[range] )
                            index = restaurant2.firstIndex(of: ";")
                        }
                        if restaurant2 == searching{
                            restaurant = restaurant2
                        }
                        return Bool(restaurant == searching)
                        
                    })
                case "סיורים מודרכים":
                    listGuidedToursFilter = listGuidedToursFavorites.filter({(guidedTours) in
                        return Bool(guidedTours.guidedTours.Region == searching)
                    })
                case "אטרקציות":
                    listAttractionsFilter = listAttractionsFavorites.filter({(attractions) in
                        return Bool(attractions.attraction.Attraction_Type == searching)
                    })
                default: break
                }
                
            }
            
//UserDefaults.standard.removeObserver(self, forKeyPath: "searching")
            self.tableType.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if listAttractionsFavorites.count == 0{
            for attraction in listAttractions{
                listAttractionsFavorites.append(FavoritesAttractions(attraction: attraction, hasFavorited: false))
            }
        }
        if listTracksFavorites.count == 0{
            for track in listTracks{
                listTracksFavorites.append(FavoritesTracks(track: track, hasFavorited: false))
            }
        }
        if listFoodFavorites.count == 0{
            for food in listFood{
                listFoodFavorites.append(FavoritesFood(food: food, hasFavorited: false))
            }
        }
        if listGuidedToursFavorites.count == 0{
            for guidedTours in listGuidedTours{
                listGuidedToursFavorites.append(FavoritesGuidedTours(guidedTours: guidedTours, hasFavorited: false))
            }
        }
        if Auth.auth().currentUser?.uid == nil{
        }
        else{
        switch type {
        case "מסלולים":
            let user = Auth.auth().currentUser?.uid
            let ref = Database.database().reference().child("users").child(user!).child("favorite").child(listTracks[0].City).child("מסלולים")
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                for i in 0...self.listTracks.count-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    if username.value is NSNull{
                        return
                    }
                    else{
                        for y in 0...self.listTracksFavorites.count-1{
                            if self.listTracksFavorites[y].track.Name == username.value as? String {
                                self.listTracksFavorites[y].hasFavorited = true
                            }
                        }
                    }
                }
            })
            self.tableType.reloadData()
        case "אוכל":
            let user = Auth.auth().currentUser?.uid
            let ref = Database.database().reference().child("users").child(user!).child("favorite").child(listFood[0].City).child("אוכל")
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                for i in 0...self.listFood.count-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    if username.value is NSNull{
                        return
                    }
                    else{
                        for y in 0...self.listFoodFavorites.count-1{
                            if self.listFoodFavorites[y].food.Name == username.value as? String {
                                self.listFoodFavorites[y].hasFavorited = true
                            }
                        }
                    }
                }
            })
            self.tableType.reloadData()
        case "סיורים מודרכים":
            let user = Auth.auth().currentUser?.uid
            let ref = Database.database().reference().child("users").child(user!).child("favorite").child(listGuidedTours[0].City).child("סיורים מודרכים")
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                for i in 0...self.listGuidedTours.count-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    if username.value is NSNull{
                        return
                    }
                    else{
                        for y in 0...self.listGuidedToursFavorites.count-1{
                            if self.listGuidedToursFavorites[y].guidedTours.Name == username.value as? String {
                                self.listGuidedToursFavorites[y].hasFavorited = true
                            }
                        }
                    }
                }
            })
            self.tableType.reloadData()
        default:
            let user = Auth.auth().currentUser?.uid
            let ref = Database.database().reference().child("users").child(user!).child("favorite").child(listAttractions[0].City).child("אטרקציות")
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                for i in 0...self.listAttractions.count-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    if username.value is NSNull{
                        return
                    }
                    else{
                        for y in 0...self.listAttractionsFavorites.count-1{
                            if self.listAttractionsFavorites[y].attraction.Name == username.value as? String {
                                self.listAttractionsFavorites[y].hasFavorited = true
                            }
                        }
                    }
                }
            })
            self.tableType.reloadData()
        }
            
    }
       
//        tableType.register(DetailsCityTableViewCell.self, forCellReuseIdentifier: "cellType")
//        self.navigationController?.navigationBar.transparentNavigationBar()
//       UserDefaults.standard.set(nil, forKey: "searching")
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
//        viewFiltering.addGestureRecognizer(gesture)
        titleItem.title = type
//        if UserDefaults.standard.string(forKey: "searching") != nil {
//            searching = UserDefaults.standard.string(forKey: "searching")
//        }
        UserDefaults.standard.addObserver(self, forKeyPath: "searching", options: .new, context: nil)
        switch type {
            case "מסלולים":
                imageTypeMain.sd_setImage(with: URL(string: imageTracks))
                let placesData = try! JSONEncoder().encode(listTracks)
                UserDefaults.standard.set(placesData, forKey: "listTracks")
            case "אוכל":
                imageTypeMain.sd_setImage(with: URL(string: imageFood))
                let placesData = try! JSONEncoder().encode(listFood)
                UserDefaults.standard.set(placesData, forKey: "listFood")
            case "סיורים מודרכים":
                imageTypeMain.sd_setImage(with: URL(string: imageGuidedTours))
                let placesData = try! JSONEncoder().encode(listGuidedTours)
                UserDefaults.standard.set(placesData, forKey: "listGuidedTours")
            case "אטרקציות":
                imageTypeMain.sd_setImage(with: URL(string: imageAttractions))
//                UserDefaults.standard.set(listAttractions, forKey: "listAttractions")
                let placesData = try! JSONEncoder().encode(listAttractions)
                UserDefaults.standard.set(placesData, forKey: "listAttractions")
            default: break
            }
        
        
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
}
extension DetailsCity: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case "מסלולים":
            if searching != nil && searching != "הכל"{
                return listTracksFilter.count
            }
            else{
                return listTracks.count
            }
        case "אוכל":
            if searching != nil && searching != "הכל" {
                return listFoodFilter.count
            }
            else{
                return listFood.count
            }
        case "סיורים מודרכים":
            if searching != nil && searching != "הכל"{
                return listGuidedToursFilter.count
            }
            else{
                return listGuidedTours.count
            }
        default:
            if searching != nil && searching != "הכל" {
                return listAttractionsFilter.count
            }
            else{
                return listAttractions.count
            }
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch type {
        case "מסלולים":
            if searching != nil && searching != "הכל" {
                performSegue(withIdentifier: "oneTypeTable", sender: listTracksFilter[indexPath.row])
            }
            else{
                performSegue(withIdentifier: "oneTypeTable", sender: listTracks[indexPath.row])
            }
        case "אוכל":
            if searching != nil && searching != "הכל"{
                performSegue(withIdentifier: "oneTypeTable", sender: listFoodFilter[indexPath.row])
            }
            else{
                performSegue(withIdentifier: "oneTypeTable", sender: listFood[indexPath.row])
            }
        case "סיורים מודרכים":
            if searching != nil && searching != "הכל" {
                performSegue(withIdentifier: "oneTypeTable", sender: listGuidedToursFilter[indexPath.row])
            }
            else{
                performSegue(withIdentifier: "oneTypeTable", sender: listGuidedTours[indexPath.row])
            }
        default:
            if searching != nil && searching != "הכל"{
                performSegue(withIdentifier: "oneTypeTable", sender: listAttractionsFilter[indexPath.row])
            }
            else{
                performSegue(withIdentifier: "oneTypeTable", sender: listAttractions[indexPath.row])
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellType", for: indexPath) as? DetailsCityTableViewCell
        cell?.link = self
        switch type {
        case "מסלולים":
            if searching != nil && searching != "הכל" {
                cell?.cellInTracks(with: listTracksFilter[indexPath.row].track, myLocation: myLocation ?? location)
                cell?.accessoryView?.tintColor = listTracksFilter[indexPath.row].hasFavorited ? .yellow : .lightGray
            }
            else{
                cell?.cellInTracks(with: listTracks[indexPath.row] , myLocation: myLocation ?? location)
                if listTracksFavorites.count > 0 {
                    cell?.accessoryView?.tintColor = listTracksFavorites[indexPath.row].hasFavorited ? .yellow : .lightGray
                }
            }
        case "אוכל":
            if searching != nil && searching != "הכל"{
                cell?.cellInFood(with: listFoodFilter[indexPath.row].food, myLocation: myLocation ?? location)
                cell?.accessoryView?.tintColor = listFoodFilter[indexPath.row].hasFavorited ? .yellow : .lightGray
            }
            else{
                cell?.cellInFood(with: listFood[indexPath.row], myLocation: myLocation ?? location)
                if listFoodFavorites.count > 0 {
                    cell?.accessoryView?.tintColor = listFoodFavorites[indexPath.row].hasFavorited ? .yellow : .lightGray
                }
            }
        case "סיורים מודרכים":
            if searching != nil && searching != "הכל" {
                cell?.cellInGuidedTours(with: listGuidedToursFilter[indexPath.row].guidedTours, myLocation: myLocation ?? location)
                cell?.accessoryView?.tintColor = listGuidedToursFilter[indexPath.row].hasFavorited ? .yellow : .lightGray
                
            }
            else{
                cell?.cellInGuidedTours(with: listGuidedTours[indexPath.row], myLocation: myLocation ?? location)
                
                if listGuidedToursFavorites.count > 0 {
                    cell?.accessoryView?.tintColor = listGuidedToursFavorites[indexPath.row].hasFavorited ? .yellow : .lightGray
                }
            }
        default:
            if searching != nil && searching != "הכל"{
                cell?.cellInAttractions(with: listAttractionsFilter[indexPath.row].attraction, myLocation: myLocation ?? location)
                cell?.accessoryView?.tintColor = listAttractionsFilter[indexPath.row].hasFavorited ? .yellow : .lightGray
            
            }
            else{
                cell?.cellInAttractions(with: listAttractions[indexPath.row], myLocation: myLocation ?? location)

                if listAttractionsFavorites.count > 0 {
                    cell?.accessoryView?.tintColor = listAttractionsFavorites[indexPath.row].hasFavorited ? .yellow : .lightGray
                }
                
                
            }
        
        }
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            print(identifier)
            switch identifier {
            case "oneTypeTable":
                let destOneType = segue.destination as! OneTypeViewController
                
                switch type {
                case "מסלולים":
                    
                    destOneType.track = sender as? Tracks
                    OneTypeViewController.listTracks = listTracks
                    addToFavoriteFirebaseTracks()
                case "אוכל":
                    //            let list = listFood
                    destOneType.food = sender as? Food
                OneTypeViewController.listFood = listFood
                    
                    addToFavoriteFirebaseFood()
                case "סיורים מודרכים":
                    //            let list = listGuidedTours
                    destOneType.guidedTours = sender as? GuidedTours
                    OneTypeViewController.listGuidedTours = listGuidedTours
                //            dest2.listGuidedTours = listGuidedTours
                    addToFavoriteFirebaseGuidedTours()
                    
                default:
                    //            let list = listAttractions
                    destOneType.attraction = sender as? Attractions
                    //            dest2.listAttractions = listAttractions
                    OneTypeViewController.listAttractions = listAttractions
                    addToFavoriteFirebaseAttractions()
                    
                }
            case "mapViewAndView":
                let destMap = segue.destination as! MapScreen
                switch type {
                case "מסלולים":
                    //           let list = listTracks
                    destMap.listTracks = listTracks
                //            dest2.listTracks = listTracks
                    addToFavoriteFirebaseTracks()
                case "אוכל":
                    //            let list = listFood
                    destMap.listFood = listFood
                //            dest2.listFood = listFood
                    
                    addToFavoriteFirebaseFood()
                case "סיורים מודרכים":
                    //            let list = listGuidedTours
                    destMap.listGuidedTours = listGuidedTours
                //            dest2.listGuidedTours = listGuidedTours
                    addToFavoriteFirebaseGuidedTours()
                default:
                    //            let list = listAttractions
                    destMap.listAttractions = listAttractions
                    //            dest2.listAttractions = listAttractions
                    addToFavoriteFirebaseAttractions()
                }
           
            default:
                break
            }

        
    }
      
}
    func addToFavoriteFirebaseFood() {
        if listFoodFavorites.count > 0{
            if Auth.auth().currentUser?.uid == nil{
            }
            else{
                guard let uid = Auth.auth().currentUser?.uid else{return}
                let data = Database.database().reference().child("users").child(uid).child("favorite").child(listFood[0].City).child("אוכל")
                removeData(data: data)
                let dic = NSMutableDictionary()
                var y = 0
                for i in 0...listFoodFavorites.count-1{
                    if listFoodFavorites[i].hasFavorited == true{
                        dic.setValue(listFoodFavorites[i].food.Name, forKey: (String)(y))
                        y+=1
                    }
                }
                data.updateChildValues(dic as [NSObject : AnyObject]) { (error, ref) in
                    if(error != nil){
                        print("Error",error!)
                    }else{
                        print("Added successfully...")
                    }
                }
                
            }
        }
    }
    func removeData(data : DatabaseReference){
        data.removeValue(completionBlock: { (error, refer) in
            if error != nil {
                print(error as Any)
            } else {
                print(refer)
                print("Child Removed Correctly")
            }
        })
    }
    func addToFavoriteFirebaseTracks() {
        if listTracksFavorites.count > 0{
            if Auth.auth().currentUser?.uid == nil{
            }
            else{
                guard let uid = Auth.auth().currentUser?.uid else{return}
                let data = Database.database().reference().child("users").child(uid).child("favorite").child(listTracks[0].City).child("מסלולים")
                removeData(data: data)
               
                
                let dic = NSMutableDictionary()
                var y = 0
                    for i in 0...self.listTracksFavorites.count-1{
                        if self.listTracksFavorites[i].hasFavorited == true{
                        dic.setValue(self.listTracksFavorites[i].track.Name, forKey: (String)(y))
                        y+=1
                    }
                }
                data.updateChildValues(dic as [NSObject : AnyObject]) { (error, ref) in
                    if(error != nil){
                        print("Error",error!)
                    }else{
                        print("Added successfully...")
                    }
                }
                
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        myLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        locValue1 = locValue
//        //        print("locations = \(locValue.latitude) \(locValue.longitude)")
//
//    }
    func addToFavoriteFirebaseAttractions() {
        if listAttractionsFavorites.count > 0{
            if Auth.auth().currentUser?.uid == nil{
            }
            else{
                guard let uid = Auth.auth().currentUser?.uid else{return}
                let data = Database.database().reference().child("users").child(uid).child("favorite").child(listAttractions[0].City).child("אטרקציות")
                removeData(data: data)
                let dic = NSMutableDictionary()
                var y = 0
                for i in 0...listAttractionsFavorites.count-1{
                    if listAttractionsFavorites[i].hasFavorited == true{
                        dic.setValue(listAttractionsFavorites[i].attraction.Name, forKey: (String)(y))
                        y+=1
                    }
                }
                data.updateChildValues(dic as [NSObject : AnyObject]) { (error, ref) in
                    if(error != nil){
                        print("Error",error!)
                    }else{
                        print("Added successfully...")
                    }
                }
                
            }
        }
    }
    func addToFavoriteFirebaseGuidedTours() {
        if listGuidedToursFavorites.count > 0{
            if Auth.auth().currentUser?.uid == nil{
            }
            else{
                guard let uid = Auth.auth().currentUser?.uid else{return}
                let data = Database.database().reference().child("users").child(uid).child("favorite").child(listGuidedTours[0].City).child("סיורים מודרכים")
                removeData(data: data)
                let dic = NSMutableDictionary()
                var y = 0
                for i in 0...listGuidedToursFavorites.count-1{
                    if listGuidedToursFavorites[i].hasFavorited == true{
                        dic.setValue(listGuidedToursFavorites[i].guidedTours.Name, forKey: (String)(y))
                        y+=1
                    }
                }
                data.updateChildValues(dic as [NSObject : AnyObject]) { (error, ref) in
                    if(error != nil){
                        print("Error",error!)
                    }else{
                        print("Added successfully...")
                    }
                }
                
            }
        }
    }
}
