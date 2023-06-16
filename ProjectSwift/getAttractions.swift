//
//  getAttractions.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
struct getAttractions{
    
    
    func readJsonHttp(city :String ,completion: @escaping (_ success: Bool, _ list: [Attractions]) -> Void){
        var listAttractions = [Attractions]()
        var Id :Int?
        var Name :String?
        var ShortDescription  :String?
        var FullDescription  :String?
        var VendorId : String?
        var Vendor_Name :String?
        var Product_Url :String?
        var Pic_Url :String?
        var Accessibility  :String?
        var Address  :String?
        var Attraction_Type :String?
        var Blue_Flag :String?
        var City :String?
        var Email :String?
        var Fax :String?
        var Near_To :String?
        var Notes_for_opening_hours :String?
        var Opening_Hours :String?
        var Parking :String?
        var Phone :String?
        var Region :String?
        var Suitable_for_Children :String?
        var URL1 :String?
        var X :Double?
        var Y :Double?
        var test = true
        
        let http  = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/JSON_Attractions.json?alt=media&token=5b950b64-c6c7-46fb-92f4-9e7b75f7ea29"
        
        guard let url = URL(string: http) else {return }
        URLSession.shared.dataTask(with: url) {(data,res,err) in
            
            guard let data = data else {return}
            guard let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as? [Any] else{return }
            print(city)
            for peopleDict in jsonObject {
                guard let feed = peopleDict as? JSON else{return}
                for (name,value) in feed {
                    if name == "Id"{Id = (value as? Int)}
                    if name == "Name"{Name = (value as? String)}
                    if name == "ShortDescription"{ShortDescription = (value as? String)}
                    if name == "FullDescription"{FullDescription = (value as? String)}
                    if name == "VendorId"{VendorId = (value as? String)}
                    if name == "Vendor_Name"{Vendor_Name = (value as? String)}
                    if name == "Product_Url"{Product_Url = (value as? String)}
                    if name == "Pic_Url"{Pic_Url = (value as? String)}
                    if name == "Accessibility"{Accessibility = (value as? String)}
                    if name == "Address"{Address = (value as? String)}
                    if name == "Attraction_Type"{Attraction_Type = (value as? String)}
                    if name == "Blue_Flag"{Blue_Flag = (value as? String)}
                    if name == "City"{
                        City = (value as? String)
                        if City == city{
                           test = true
                        }else{
                            test = false
                        }
                    }
                    if name == "Email"{Email = (value as? String)}
                    if name == "Fax"{Fax = (value as? String)}
                    if name == "Near_To"{Near_To = (value as? String)}
                    if name == "Notes_for_opening_hours"{Notes_for_opening_hours = (value as? String)}
                    if name == "Opening_Hours"{Opening_Hours = (value as? String)}
                    if name == "Parking"{Parking = (value as? String)}
                    if name == "Phone"{Phone = (value as? String)}
                    if name == "Region"{Region = (value as? String)}
                    if name == "Suitable_for_Children"{Suitable_for_Children = (value as? String)}
                    if name == "URL"{URL1 = (value as? String)}
                    if name == "X"{
                        if let toDouble = value as? String {
                            X = Double(toDouble)
                        }
                    }
                    if name == "Y"{
                        if let toDouble = value as? String {
                            Y = Double(toDouble)
                        }   
                    }
                }
                if test == true {
                    listAttractions.append(Attractions(Id: Id ?? 0, Name: Name ?? "", ShortDescription: ShortDescription ?? "", FullDescription: FullDescription ?? "", VendorId: VendorId ?? "", Vendor_Name: Vendor_Name ?? "", Product_Url: Product_Url ?? "", Pic_Url: Pic_Url ?? "", Accessibility: Accessibility ?? "", Address: Address ?? "", Attraction_Type: Attraction_Type ?? "", Blue_Flag: Blue_Flag ?? "", City: City ?? "", Email: Email ?? "", Fax: Fax ?? "", Near_To: Near_To ?? "", Notes_for_opening_hours: Notes_for_opening_hours ?? "", Opening_Hours: Opening_Hours ?? "", Parking: Parking ?? "", Phone: Phone ?? "", Region: Region ?? "", Suitable_for_Children: Suitable_for_Children ?? "", URL: URL1 ?? "", X: X ?? 0.0, Y: Y ?? 0.0))
                }
                
            }
            if(listAttractions.count > 0){
                completion(true,listAttractions)
            }
            }.resume()
        
    }
    typealias JSON = [String: Any]
}
