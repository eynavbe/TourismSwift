//
//  OneTypeViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 02/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage
import SwiftSoup

class OneTypeViewController: UIViewController {
    var isLabelAtMaxHeight = false
    var isLabelAtMaxHeightOpeningHours = false

    @IBOutlet weak var openingHoursHeight: NSLayoutConstraint!
    @IBOutlet weak var moreOnTypeHeight: NSLayoutConstraint!
    @IBOutlet weak var moreOnType: UIButton!
    
    
    
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
    static var listAttractions = [Attractions]()
    static var listTracks = [Tracks]()
    static var listGuidedTours = [GuidedTours]()
    static var listFood = [Food]()
    @IBAction func readMoreOpeningHours(_ sender: UIButton) {
        if isLabelAtMaxHeightOpeningHours {
            if attraction != nil{
                if attraction!.Opening_Hours != ""{
                    typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                }
            }
            if track != nil{
                typeOpeningHours.setTitle("", for: .normal)
            }
            if food != nil{
                if food!.Opening_Hours != ""{
                    typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                }
            }
            if guidedTours != nil{
                if guidedTours!.Opening_Hours != ""{
                    typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                }
            }
            isLabelAtMaxHeightOpeningHours = false
            openingHoursHeight.constant = 33
            //            moreOnType.titleLabel?.sizeToFit()
        }
        else {
            if attraction != nil{
                if attraction!.Opening_Hours != ""{
                    let opening_Hours : String = attraction!.Opening_Hours
                    let result = opening_Hours.split(separator: ",")
                    let resultEnter = opening_Hours.components(separatedBy: "   ")
                    var newOpening_Hours = "שעות פתיחה" + "\n"
                    if resultEnter.count < 2{
                        if result.count > 0{
                            for i in 0...result.count-1{
                                newOpening_Hours = newOpening_Hours + result[i] + "\n"
                            }
                        }
                    }
                    else{
                        for i in 0...resultEnter.count-1{
                            for char in resultEnter[i].unicodeScalars {
                                if char.isASCII {
                                    newOpening_Hours = newOpening_Hours + resultEnter[i] + "\n"
                                    break
                                }
                                
                            }
                        }
                    }
                    
                    typeOpeningHours.setTitle(newOpening_Hours, for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                      typeOpeningHours.titleLabel?.textAlignment = .right
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    openingHoursHeight.constant = getLabelHeight(text: newOpening_Hours, width: view.bounds.width)
                }
            }

            if track != nil{
                typeOpeningHours.setTitle("", for: .normal)
                
            }
            if food != nil{
                if food!.Opening_Hours != ""{
                    let opening_Hours : String = food!.Opening_Hours
                    let result = opening_Hours.split(separator: ",")
                    let resultEnter = opening_Hours.components(separatedBy: "   ")
                    var newOpening_Hours = "שעות פתיחה" + "\n"
                    if resultEnter.count < 2{
                        if result.count > 0{
                            for i in 0...result.count-1{
                                newOpening_Hours = newOpening_Hours + result[i] + "\n"
                            }
                        }
                    }
                    else{
                        for i in 0...resultEnter.count-1{
                            for char in resultEnter[i].unicodeScalars {
                                if char.isASCII {
                                    newOpening_Hours = newOpening_Hours + resultEnter[i] + "\n"
                                    break
                                }
                                
                            }
                        }
                    }
                    typeOpeningHours.setTitle(newOpening_Hours, for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.titleLabel?.textAlignment = .right
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    openingHoursHeight.constant = getLabelHeight(text: newOpening_Hours, width: view.bounds.width)
                }
            }
            if guidedTours != nil{
                if guidedTours!.Opening_Hours != ""{
                    let opening_Hours : String = guidedTours!.Opening_Hours
                    let result = opening_Hours.split(separator: ",")
                    let resultEnter = opening_Hours.components(separatedBy: "   ")
                    var newOpening_Hours = "שעות פתיחה" + "\n"
                    if resultEnter.count < 2{
                        if result.count > 0{
                            for i in 0...result.count-1{
                                newOpening_Hours = newOpening_Hours + result[i] + "\n"
                            }
                        }
                    }
                    else{
                        for i in 0...resultEnter.count-1{
                            for char in resultEnter[i].unicodeScalars {
                                if char.isASCII {
                                    newOpening_Hours = newOpening_Hours + resultEnter[i] + "\n"
                                    break
                                }
                                
                            }
                        }
                    }
                    typeOpeningHours.setTitle(newOpening_Hours, for: .normal)
                    typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
                    typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    typeOpeningHours.titleLabel?.textAlignment = .right
                    typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
                    openingHoursHeight.constant = getLabelHeight(text: newOpening_Hours, width: view.bounds.width)
                }
            }
            isLabelAtMaxHeightOpeningHours = true
            
        }
    }
    @IBAction func readMoreLessOnType(_ sender: UIButton) {
        if isLabelAtMaxHeight {
            if attraction != nil{
                if attraction!.FullDescription != ""{
                    let fullDescription = read(html: attraction!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                }
            }
            if track != nil{
                if track?.FullDescription != ""{
                    let fullDescription = read(html: track!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                }
            }
            if food != nil{
                if food!.FullDescription != ""{
                    let fullDescription = read(html: food!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                }
            }
            if guidedTours != nil{
                if guidedTours!.FullDescription != ""{
                    let fullDescription = read(html: guidedTours!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                }
            }
            isLabelAtMaxHeight = false
            moreOnTypeHeight.constant = 100
//            moreOnType.titleLabel?.sizeToFit()
        }
        else {
            if attraction != nil{
                if attraction!.FullDescription != ""{
                    let fullDescription = read(html: attraction!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                    moreOnTypeHeight.constant = getLabelHeight(text: attraction!.FullDescription, width: view.bounds.width)
                }
            }
            if track != nil{
                if track!.FullDescription != ""{
                    let fullDescription = read(html: track!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                    moreOnTypeHeight.constant = getLabelHeight(text: track!.FullDescription, width: view.bounds.width)
                }
            }
            if food != nil{
                if food!.FullDescription != ""{
                    let fullDescription = read(html: food!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                    moreOnTypeHeight.constant = getLabelHeight(text: food!.FullDescription, width: view.bounds.width)
                }
            }
            if guidedTours != nil{
                if guidedTours!.FullDescription != ""{
                    let fullDescription = read(html: guidedTours!.FullDescription)
                    moreOnType.setTitle(fullDescription, for: .normal)
                    moreOnTypeHeight.constant = getLabelHeight(text: guidedTours!.FullDescription, width: view.bounds.width)
                }
            }
            isLabelAtMaxHeight = true
            
        }
    }
    func getLabelHeight(text: String, width: CGFloat) -> CGFloat {
        let lbl = UILabel(frame: .zero)
        lbl.frame.size.width = width
        lbl.numberOfLines = 0
        lbl.text = text
        lbl.sizeToFit()
        
        return lbl.frame.size.height
    }
    @IBOutlet weak var imageViewType: UIImageView!
    
    @IBAction func typeArrivalInstructions(_ sender: UIButton) {
        var latitude = 0.0
        var longitude = 0.0
        if attraction != nil{
            latitude = attraction!.Y
            longitude = attraction!.X
        }
        if track != nil{
            latitude = track!.Starting_point_Y
            longitude = track!.Starting_point_X
            
        }
        if food != nil {
            latitude = food!.Y
            longitude = food!.X
            
        }
        if guidedTours != nil{
            latitude = guidedTours!.Starting_point_Y
            longitude = guidedTours!.Starting_point_X
        }
        let optionMenu = UIAlertController(title: nil, message: "תפתח את הוראות ההגעה עם", preferredStyle: .actionSheet)
        optionMenu.modalPresentationStyle = .popover
        let googleMapAction = UIAlertAction(title: "GoogleMap", style: .default, handler: { (actionSheetController) -> Void in
            
            
            let appDomen: String = "comgooglemaps://"
            let browserDomen: String = "https://www.google.co.in/maps/dir/"
            let directionBody: String = "?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving"
            
            // Make route with google maps application
            if let appUrl = URL(string: appDomen), UIApplication.shared.canOpenURL(appUrl) {
                guard let appFullPathUrl = URL(string: appDomen + directionBody) else { return }
                UIApplication.shared.open(appFullPathUrl)
                // If user don't have an application make route in browser
            } else if let browserUrl = URL(string: browserDomen), UIApplication.shared.canOpenURL(browserUrl) {
                guard let browserFullPathUrl = URL(string: browserDomen + directionBody) else { return }
                UIApplication.shared.open(browserFullPathUrl)
            }
        })
        
        
        
        
        let imageGoogle = UIImage(named: "google")
        let imageViewGoogle = UIImageView()
        imageViewGoogle.image = imageGoogle
        imageViewGoogle.frame =  CGRect(x: 25, y: 60, width: 24, height: 24)
        optionMenu.view.addSubview(imageViewGoogle)
        
//        googleMapAction.setValue(imageGoogle, forKey: "image")
//        let imageMoovit = UIImage(named: "food")
        
        let moovitMapAction = UIAlertAction(title: "Moovit", style: .default, handler: { (actionSheetController) -> Void in
            
            let appDomen: String = "moovit://"
            let browserDomen: String =  "https://moovitapp.com/?tll=\(latitude)_\(longitude)"

            // Make route with google maps application
            if let appUrl = URL(string: appDomen), UIApplication.shared.canOpenURL(appUrl) {
                guard let appFullPathUrl = URL(string: appDomen ) else { return }
                UIApplication.shared.open(appFullPathUrl)
                // If user don't have an application make route in browser
            } else if let browserUrl = URL(string: browserDomen), UIApplication.shared.canOpenURL(browserUrl) {
                guard let browserFullPathUrl = URL(string: browserDomen) else { return }
                UIApplication.shared.open(browserFullPathUrl)
            }
        })
        let imageMoovit = UIImage(named: "moovit")
        let imageViewMoovit = UIImageView()
        imageViewMoovit.image = imageMoovit
        let sizeMoovit = CGSize(width: 32.0, height: 32.0)
        imageViewMoovit.sizeThatFits(sizeMoovit)
        imageViewMoovit.frame =  CGRect(x: 25, y: 117, width: 24, height: 24)
        optionMenu.view.addSubview(imageViewMoovit)
//        moovitMapAction.setValue(imageMoovit, forKey: "image")
//        let imageWaze = UIImage(named: "food")
        let wazeMapAction = UIAlertAction(title: "Waze", style: .default, handler: { (actionSheetController) -> Void in
            
            let appDomen: String = "waze://"
            let browserDomen: String = "https://www.waze.com/ul"
            let directionBody: String = "?ll=\(latitude),\(longitude)&z=10&navigate=yes"
            
            // Make route with google maps application
            if let appUrl = URL(string: appDomen), UIApplication.shared.canOpenURL(appUrl) {
                guard let appFullPathUrl = URL(string: appDomen + directionBody) else { return }
                UIApplication.shared.open(appFullPathUrl)
                // If user don't have an application make route in browser
            } else if let browserUrl = URL(string: browserDomen), UIApplication.shared.canOpenURL(browserUrl) {
                guard let browserFullPathUrl = URL(string: browserDomen + directionBody) else { return }
                UIApplication.shared.open(browserFullPathUrl)
            }
        })
        let imageWaze = UIImage(named: "waze")
        let imageViewWaze = UIImageView()
        imageViewWaze.image = imageWaze
        let sizeWaze = CGSize(width: 32.0, height: 32.0)
        imageViewWaze.sizeThatFits(sizeWaze)
        imageViewWaze.frame =  CGRect(x: 25, y: 174, width: 24, height: 24)
        optionMenu.view.addSubview(imageViewWaze)

        optionMenu.addAction(googleMapAction)
        optionMenu.addAction(moovitMapAction)
        optionMenu.addAction(wazeMapAction)

        self.present(optionMenu, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            optionMenu.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
        
        
        
    }
    @objc func dismissAlertController(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func callPhoneType(_ sender: UIButton) {
        call()
    }
    
    @IBOutlet weak var typePhoneNumber: UIButton!
    @IBAction func callPhone(_ sender: UIButton) {
       call()
        
    }
    func read(html:String) -> String{
        do {
//            let html: String = "<p>An <a href='http://example.com/'><b>example</b></a> link.</p>";
            let doc: Document = try SwiftSoup.parse(html)
//            let link: Element = try doc.select("a").first()!
            
            let text: String = try doc.body()!.text();
            return text
//            let link: Array< Element> = try doc.select("p").array()
//            var linkText: String
//            var dkkk = ""
//            dkkk.append("s")
//            for l in link {
//                dkkk.append(try l.text())
//            }
//            return dkkk
        } catch Exception.Error(let type, let message) {
            print(type)
            print(message)
        } catch {
            print("error")
        }
        return ""
    }
    func call(){
        if attraction != nil{
            if attraction!.Phone != ""{
                let phone = read(html: attraction!.Phone)
                guard let number = URL(string: "tel://" + phone) else { return }
                UIApplication.shared.open(number)
            }
        }
        if track != nil{
            if track!.Phone != ""{
                let phone = read(html: track!.Phone)
                guard let number = URL(string: "tel://" + phone) else { return }
                UIApplication.shared.open(number)
            }
        }
        if food != nil{
            if food!.Phone != ""{
                let phone = read(html: food!.Phone)
                guard let number = URL(string: "tel://" + phone) else { return }
                UIApplication.shared.open(number)
            }
        }
        if guidedTours != nil{
            if guidedTours!.Phone != ""{
                let phone = read(html: guidedTours!.Phone)
                guard let number = URL(string: "tel://" + phone) else { return }
                UIApplication.shared.open(number)
            }
        }
    }
    @IBAction func typeWebsite(_ sender: UIButton) {
        openWebsite()
    }
    @IBOutlet weak var mapViewSmall: MKMapView!
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBAction func website(_ sender: Any) {
        openWebsite()
    }
    func openWebsite() {
        if attraction != nil{
            if let url = URL(string: attraction!.URL),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        if track != nil{
            if let url = URL(string: track!.URL),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        if food != nil{
            if let url = URL(string: food!.URL),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        if guidedTours != nil{
            if let url = URL(string: guidedTours!.URL),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    @IBOutlet weak var websiteT: UIButton!
    @IBOutlet weak var typeAddress: UIButton!
    @IBOutlet weak var typeOfType: UILabel!
    @IBAction func addressOnMap(_ sender: UIButton) {
        mapAddress()
    }
    @IBOutlet weak var nameType: UILabel!
    var attraction: Attractions?
    
    var track: Tracks?
    var guidedTours:GuidedTours?
    var food: Food?
    @IBOutlet weak var typeOpeningHours: UIButton!
    func mapAddress() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "MoreAboutCity", bundle:nil)
        
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "MapScreenId") as! MapScreen
         if attraction != nil{
            var listAttractionsOne = [Attractions]()
            listAttractionsOne.append(attraction!)
            let placesData = try! JSONEncoder().encode(listAttractionsOne)
            UserDefaults.standard.set(placesData, forKey: "listAttractions")
            var list = OneTypeViewController.listAttractions
            
            for i in 0..<list.count{
                if list[i].Name == attraction?.Name{
                    secondViewController.index = i
                }
            }
            secondViewController.listAttractions = OneTypeViewController.listAttractions
        }
        if food != nil{
            var listFoodOne = [Food]()
            listFoodOne.append(food!)
            let placesData = try! JSONEncoder().encode(listFoodOne)
            UserDefaults.standard.set(placesData, forKey: "listFood")
            var list = OneTypeViewController.listFood
            
            for i in 0..<list.count{
                if list[i].Name == food?.Name{
                    secondViewController.index = i
                }
            }
            secondViewController.listFood = OneTypeViewController.listFood
        }
        if track != nil{
            var listTracksOne = [Tracks]()
            listTracksOne.append(track!)
            let placesData = try! JSONEncoder().encode(listTracksOne)
            UserDefaults.standard.set(placesData, forKey: "listTracks")
            var list = OneTypeViewController.listTracks
            
            for i in 0..<list.count{
                if list[i].Name == track?.Name{
                    secondViewController.index = i
                }
            }
            secondViewController.listTracks = OneTypeViewController.listTracks
        }
        if guidedTours != nil{
            var listGuidedToursOne = [GuidedTours]()
            listGuidedToursOne.append(guidedTours!)
            let placesData = try! JSONEncoder().encode(listGuidedToursOne)
            UserDefaults.standard.set(placesData, forKey: "listGuidedTours")
            
//            secondViewController.listGuidedTours = listGuidedToursOne
            var list = OneTypeViewController.listGuidedTours
            
            for i in 0..<list.count{
                if list[i].Name == guidedTours?.Name{
                    secondViewController.index = i
                }
            }
            secondViewController.listGuidedTours = OneTypeViewController.listGuidedTours
        }
        self.present(secondViewController, animated:true, completion:nil)
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        mapAddress()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.mapViewSmall.addGestureRecognizer(gesture)
        
        
        if attraction != nil{
            navigationTitle.title = attraction?.Name
            nameType.text = attraction?.Name
            typeOfType.text = attraction?.Attraction_Type
            let fullDescription = read(html: attraction!.FullDescription)
            moreOnType.setTitle(fullDescription, for: .normal)
            let imageURL = self.imgFolder + attraction!.Pic_Url
            imageViewType.sd_setImage(with: URL(string: imageURL))
            
            typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
            typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
            typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            let phone = read(html: attraction!.Phone)
            typePhoneNumber.setTitle(phone, for: .normal)
            typePhoneNumber.setImage(UIImage(named:"phone-receiver-small" ), for: .normal)
            typePhoneNumber.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            typeAddress.setTitle(attraction?.Address, for: .normal)
            typeAddress.setImage(UIImage(named: "maps-and-flags"), for: .normal)
            typeAddress.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            websiteT.setTitle(attraction?.URL, for: .normal)
            websiteT.setImage(UIImage(named: "globe-small"), for: .normal)
            websiteT.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            changeRegion(location: attraction!.location)
            let cl2d = attraction!.location.coordinate
                
                //להראות מרקר
            let annotation = PlaceAnnotation(title: attraction?.Name,
                                             subtitle: attraction?.Address,
                                                 coordinate: cl2d)
                mapViewSmall.addAnnotation(annotation)
        }
        if track != nil{
            navigationTitle.title = track?.Name
            nameType.text = track?.Name
            typeOfType.text = track?.Trip_Type
            let fullDescription = read(html: track!.FullDescription)
            moreOnType.setTitle(fullDescription, for: .normal)
            let imageURL = self.imgFolder + track!.Pic_Url
            imageViewType.sd_setImage(with: URL(string: imageURL))
            
            typeOpeningHours.setTitle("", for: .normal)
            
            let phone = read(html: track!.Phone)
            typePhoneNumber.setTitle(phone, for: .normal)
            typePhoneNumber.setImage(UIImage(named:"phone-receiver-small" ), for: .normal)
            typePhoneNumber.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            typeAddress.setTitle(track?.Address, for: .normal)
            typeAddress.setImage(UIImage(named: "maps-and-flags"), for: .normal)
            typeAddress.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            websiteT.setTitle(track?.URL, for: .normal)
            websiteT.setImage(UIImage(named: "globe-small"), for: .normal)
            websiteT.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            changeRegion(location: track!.location)
            let cl2d = track!.location.coordinate
            
            //להראות מרקר
            let annotation = PlaceAnnotation(title: track?.Name,
                                             subtitle: track?.Address,
                                             coordinate: cl2d)
            mapViewSmall.addAnnotation(annotation)
        }
        if food != nil{
            navigationTitle.title = food?.Name
            nameType.text = food?.Name
            typeOfType.text = food?.Restaurant_
            let fullDescription = read(html: food!.FullDescription)
            moreOnType.setTitle(fullDescription, for: .normal)
            let imageURL = self.imgFolder + food!.Pic_Url
            imageViewType.sd_setImage(with: URL(string: imageURL))
            
            typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
            typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
            typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            let phone = read(html: food!.Phone)
            typePhoneNumber.setTitle(phone, for: .normal)
            typePhoneNumber.setImage(UIImage(named:"phone-receiver-small" ), for: .normal)
            typePhoneNumber.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            typeAddress.setTitle(food?.Address, for: .normal)
            typeAddress.setImage(UIImage(named: "maps-and-flags"), for: .normal)
            typeAddress.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            websiteT.setTitle(food?.URL, for: .normal)
            websiteT.setImage(UIImage(named: "globe-small"), for: .normal)
            websiteT.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            changeRegion(location: food!.location)
            let cl2d = food!.location.coordinate
            
            //להראות מרקר
            let annotation = PlaceAnnotation(title: food?.Name,
                                             subtitle: food?.Address,
                                             coordinate: cl2d)
            mapViewSmall.addAnnotation(annotation)
        }
        if guidedTours != nil{
            navigationTitle.title = guidedTours?.Name
            nameType.text = guidedTours?.Name
            typeOfType.text = ""
            let fullDescription = read(html: guidedTours!.FullDescription)
            moreOnType.setTitle(fullDescription, for: .normal)
            let imageURL = self.imgFolder + guidedTours!.Pic_Url
            imageViewType.sd_setImage(with: URL(string: imageURL))
            
            typeOpeningHours.setTitle("שעות פתיחה", for: .normal)
            typeOpeningHours.setImage(UIImage(named: "clock-circular-outline"), for: .normal)
            typeOpeningHours.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeOpeningHours.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            let phone = read(html: guidedTours!.Phone)
            typePhoneNumber.setTitle(phone, for: .normal)
            typePhoneNumber.setImage(UIImage(named:"phone-receiver-small" ), for: .normal)
            typePhoneNumber.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typePhoneNumber.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            typeAddress.setTitle(guidedTours?.Address, for: .normal)
            typeAddress.setImage(UIImage(named: "maps-and-flags"), for: .normal)
            typeAddress.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            typeAddress.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            websiteT.setTitle(guidedTours?.URL, for: .normal)
            websiteT.setImage(UIImage(named: "globe-small"), for: .normal)
            websiteT.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            websiteT.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            changeRegion(location: guidedTours!.location)
            let cl2d = guidedTours!.location.coordinate
            
            //להראות מרקר
            let annotation = PlaceAnnotation(title: guidedTours?.Name,
                                             subtitle: guidedTours?.Address,
                                             coordinate: cl2d)
            mapViewSmall.addAnnotation(annotation)
        }
    }
    
    func changeRegion(location: CLLocation){
        let cl2d = location.coordinate
        //לעשות זום למיקום
        let region = MKCoordinateRegion(center: cl2d,
                                        latitudinalMeters: 100,
                                        longitudinalMeters: 100)
        
        mapViewSmall.setRegion(region, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? DetailsCity
            else {return}
        
        if OneTypeViewController.listAttractions.count > 0 {
            dest.listAttractions = OneTypeViewController.listAttractions
            OneTypeViewController.listAttractions = [Attractions]()
            dest.type = "אטרקציות"
        }
        if OneTypeViewController.listGuidedTours.count > 0{
            dest.listGuidedTours = OneTypeViewController.listGuidedTours
            OneTypeViewController.listGuidedTours = [GuidedTours]()
            dest.type = "סיורים מודרכים"
        }
        if OneTypeViewController.listFood.count > 0{
            dest.listFood = OneTypeViewController.listFood
            OneTypeViewController.listFood = [Food]()
            dest.type = "אוכל"
        }
        if OneTypeViewController.listTracks.count > 0 {
            dest.listTracks = OneTypeViewController.listTracks
            OneTypeViewController.listTracks = [Tracks]()
            dest.type = "מסלולים"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

