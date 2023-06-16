//
//  ViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 15/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseAnalytics
import FirebaseAuth
class ViewController: BaseViewController  , CLLocationManagerDelegate, UIScrollViewDelegate{
    
    var x = 0
    
var listCommunityAndCities = [CommunityAndCities]()
    @IBOutlet weak var pageControlImageCities: UIPageControl!
    @IBOutlet weak var collectionViewImageCities: UICollectionView!
    @IBOutlet weak var yourLocationCity: UILabel!
    @IBOutlet weak var citySearch: UITextField!
    var ref: DatabaseReference!
    let city1 = CommunityAndCities(Id: 1, Name: "ירושלים", FullDescription: "", VendorName: "", ProductUrl: "", PicUrl: "0008394_jerusalem_250.jpeg", FAQ: "", Region: "", X: 0.0, Y: 0.0, Youtube: "")
    let city2 = CommunityAndCities(Id: 2, Name: "תל אביב-יפו", FullDescription: "", VendorName: "", ProductUrl: "", PicUrl: "0008421_tel-aviv-jaffa_250.jpeg", FAQ: "", Region: "", X: 0.0, Y: 0.0, Youtube: "")
    let city3 = CommunityAndCities(Id: 3, Name: "אילת", FullDescription: "", VendorName: "", ProductUrl: "", PicUrl: "0008395_eilat_250.jpeg", FAQ: "", Region: "", X: 0.0, Y: 0.0, Youtube: "")
    
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
    let locationManager = CLLocationManager()
//    var imgArr = [UIImage]()
    var imgArr  = [UIImage(named: "images"), UIImage(named: "guided tours"), UIImage(named: "Tracks")]
//    var imgArrURL = [String]()
    var imgArrURL: [String] = ["images","guided tours","Tracks"]
    @IBOutlet weak var viewYourCity: UIView!
//    override func viewDidAppear(_ animated: Bool) {
//                super.viewDidAppear(animated)
////                readJsonHttp()
////        getCities().readJsonHttp( (success,list)) -> Void in
////            if success {
////            // do second task if success
//////            secondTask()
////        }
//
//
//    }
    
    //שלוחצים על החיפוש יפנה לעמוד אחר
    @objc func myTargetFunction() {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "PlayVC") as! SearchCityTableViewController
        secondViewController.listCommunityAndCities = listCommunityAndCities
        self.present(secondViewController, animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
//        let userID = Auth.auth().currentUser!.uid
    
//        ref.child("userID").setValue(["username": 122])
//        FirebaseApp.configure()
//        Analytics.setUserProperty("food", forName: "favorite_food")
        citySearch.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        self.addSlideMenuButton()
    //        collectionView.contentInsetAdjustmentBehavior = .never
        getCities().readJsonHttp { (success, list) in
            print(success)
            
            if success {
                self.listCommunityAndCities = list
//                let jerusalemPictureURL = URL(string: self.imgFolder + self.listCommunityAndCities[0].getPicUrl())!
//                let telAvivYafoPictureURL = URL(string: self.imgFolder
//                    + self.listCommunityAndCities[1].getPicUrl())!
//                let eilatPictureURL = URL(string: self.imgFolder
//                    + self.listCommunityAndCities[2].getPicUrl())!
//                let haifaPictureURL = URL(string: self.imgFolder
//                    + self.listCommunityAndCities[3].getPicUrl())!
//                let tiberiasPictureURL = URL(string: self.imgFolder
//                    + self.listCommunityAndCities[4].getPicUrl())!
//                                    let jerusalemPictureURL = self.imgFolder + self.listCommunityAndCities[0].getPicUrl()
//                                    let telAvivYafoPictureURL = self.imgFolder
//                                        + self.listCommunityAndCities[1].getPicUrl()
//                                    let eilatPictureURL =  self.imgFolder
//                                        + self.listCommunityAndCities[2].getPicUrl()
//                                    let haifaPictureURL = self.imgFolder
//                                        + self.listCommunityAndCities[3].getPicUrl()
//                                    let tiberiasPictureURL = self.imgFolder
//                                        + self.listCommunityAndCities[4].getPicUrl()
//                                    self.imgArrURL = [jerusalemPictureURL,telAvivYafoPictureURL,eilatPictureURL,haifaPictureURL,tiberiasPictureURL]
//                let jerusalemImage = getImage(url: jerusalemPictureURL)
//                print(jerusalemImage)
//                let telAvivYafoImage = getImage(url: telAvivYafoPictureURL)
//                let eilatImage = getImage(url: eilatPictureURL)
//                let haifaImage = getImage(url: haifaPictureURL)
//                let tiberiasImage = getImage(url: tiberiasPictureURL)
//                self.imgArr = [jerusalemImage,telAvivYafoImage,eilatImage,haifaImage,tiberiasImage]
//                self.collectionViewImageCities.reloadData()
                
                DispatchQueue.main.async {
//                    self.pageControlImageCities.numberOfPages = self.imgArrURL.count
//                    self.pageControlImageCities.currentPage = 0
                    self.collectionViewImageCities.reloadData()
                }
                print(list.count)
                print("true")
//                self.collectionView.reloadData()
                
            }
        }
        print(listCommunityAndCities.count)
        
        
        
        
        let imageSearch = UIImageView(image: #imageLiteral(resourceName: "search"))
        citySearch.leftView = imageSearch
        citySearch.leftViewMode = .always
        viewYourCity.layer.borderWidth = 1
        viewYourCity.layer.borderColor = UIColor.black.cgColor
        viewYourCity.layer.cornerRadius = 5
        self.navigationController?.navigationBar.transparentNavigationBar()
        //מבקש אישור להישתמש במיקום שלו תמיד
        self.locationManager.requestAlwaysAuthorization()
        
        //מבקש אישור להישתמש במיקום שלו רק בשימוש באפליקציה
        self.locationManager.requestWhenInUseAuthorization()

        //אם יש אישור
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
        
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        var pageNumber = scrollViewImageCity.contentOffset.x / scrollView.frame.width
//        pageControlImageCity.currentPage = Int(pageNumber)
//
//    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = collectionViewImageCities.contentOffset.x / scrollView.frame.width
        pageControlImageCities.currentPage = Int(pageNumber)

    }
    
    
   //אם יש שגיאה בלקבל את המיקום
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed: \(error.localizedDescription)")
    }

     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //מקבל את המיקום
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        //מקבל שם עיר
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: locValue.latitude, longitude:  locValue.longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
            
            placemarks?.forEach { (placemark) in
                
                if let city = placemark.locality {
                    self.yourLocationCity.text = city
                    
                }
            }
        })
        
        
    }
//    //מעביר את הרשימה של הערים לעמוד הבא
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
////        if segue.destination is SearchCityTableViewController
////        {
////
////            print(listCommunityAndCities.count)
////            let vc = segue.destination as? SearchCityTableViewController
////            vc?.listCommunityAndCities = listCommunityAndCities
////
////        }
//
//        print(listCommunityAndCities.count, "cccc")
//        guard let dest = segue.destination as? SearchCityTableViewController else {return}
//
//        dest.listCommunityAndCities = listCommunityAndCities
//    }

}
//func getImage(url:URL) -> UIImage {
//    let data = try? Data(contentsOf: url)
//
//    if let imageData = data {
//        let image = UIImage(data: imageData)
//        return image!
//    }
//    return UIImage()
//
//}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //paging indicators image
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "moreAbutCity", sender: city1)
        }
        if indexPath.row == 1  {
            performSegue(withIdentifier: "moreAbutCity", sender: city2)
        }
        if indexPath.row == 2  {
            performSegue(withIdentifier: "moreAbutCity", sender: city3)
        }
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        guard segue.destination.children[0] is MoreAboutCityViewController
        //            else {return}
        let place = sender as? CommunityAndCities
        //        guard let dest = segue.destination as? SearchCityTableViewController else {return}
        //
        
        MoreAboutCityViewController.place = place
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCityCollectionViewCell
        
//    print(cell.viewWithTag(1))
//        print(imgArrURL[0])
        
        
//            pageControlImageCities.currentPage = Int(indexPath.row)
        if indexPath.row == 0 {
            cell.setCell(with: city1)
        }
        if indexPath.row == 1  {
            cell.setCell(with: city2)
        }
        if indexPath.row == 2  {
            cell.setCell(with: city3)
        }
        x = indexPath.row
//        if let vc = cell.viewWithTag(111) as? UIImageView{
////            vc.image = imgArr[indexPath.row]
//          print("=====")
//            print(imgArrURL[indexPath.row])
////            vc.sd_setImage(with: URL(string: imgArrURL[indexPath.row]))
//            vc.image = imgArr[indexPath.row]
//        }else if let ab = cell.viewWithTag(222) as? UIPageControl{
//            ab.currentPage = indexPath.row
//        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(imgArrURL.count , "imgArrURL.count")
//        return imgArrURL.count
        return imgArr.count
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionViewImageCities.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

//func imagePic(catPictureURL: URL) -> UIImage{
//    let session = URLSession(configuration: .default)
////    var image = UIImage()
//    // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
//    let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
//        // The download has finished.
//        if let e = error {
////            print("Error downloading cat picture: \(e)")
//        } else {
//            // No errors found.
//            // It would be weird if we didn't have a response, so check for that too.
//            if let res = response as? HTTPURLResponse {
////                print("Downloaded cat picture with response code \(res.statusCode)")
//                if let imageData = data {
//                    // Finally convert that Data into an image and do what you wish with it.
//                    let image = UIImage(data: imageData)!
//                    return image
//                    // Do something with your image.
//                } else {
////                    print("Couldn't get image: Image is nil")
//                }
//            } else {
////                print("Couldn't get response code for some reason")
//            }
//        }
//    }
//    return UIImage()
//}


