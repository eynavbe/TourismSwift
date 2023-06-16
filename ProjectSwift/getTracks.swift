//
//  getTracks.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
struct getTracks{
    
    
    func readJsonHttp(city :String ,completion: @escaping (_ success: Bool, _ list: [Tracks]) -> Void){
        var listTracks = [Tracks]()
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
        var Admission_Charge :String?
        var Bathing_Waters :String?
        var Best_season :String?
        var Campsite :String?
        var City :String?
        var Difficulty_Level :String?
        var Drinkable_Water :String?
        var Email :String?
        var Ending_Point :String?
        var Ending_point_X :String?
        var Ending_point_Y :String?
        var Fax :String?
        var Hiking_Maps_and_Topographic :String?
        var Interest_Areas :String?
        var Near_To :String?
        var Number_of_Days  :String?
        var Parking :String?
        var Phone :String?
        var Precautions :String?
        var Region :String?
        var Special_Equipment :String?
        var Starting_Point :String?
        var Starting_point_X :Double?
        var Starting_point_Y :Double?
        var Suitable_for_Children :String?
        var Suitable_for_Picnics :String?
        var Track_Duration :String?
        var Track_Length :String?
        var Track_Outline :String?
        var Track_Type :String?
        var Trip_Type :String?
        var URL1 :String?
        var test = true
        let http  = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/JSON_Tracks.json?alt=media&token=a15bd03a-243b-4789-a722-176f75abe021"
        
        guard let url = URL(string: http) else {return }
        URLSession.shared.dataTask(with: url) {(data,res,err) in
            
            guard let data = data else {return}
            guard let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as? [Any] else{return }
            
            for peopleDict in jsonObject {
                guard let feed = peopleDict as? JSON else{return}
                for (name,value) in feed {
                    //                print("\(name) , \(value)")
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
                    if name == "Admission_Charge"{Admission_Charge = (value as? String)}
                    if name == "Bathing_Waters"{Bathing_Waters = (value as? String)}
                    if name == "Best_season"{Best_season = (value as? String)}
                    if name == "Campsite"{Campsite = (value as? String)}
                    if name == "City"{
                        City = (value as? String)
                        if City == city{
                            test = true
                        }else{
                            test = false
                        }
                    }
                    if name == "Difficulty_Level"{Difficulty_Level = (value as? String)}
                    if name == "Drinkable_Water"{Drinkable_Water = (value as? String)}
                    if name == "Email"{Email = (value as? String)}
                    if name == "Ending_Point"{Ending_Point = (value as? String)}
                    if name == "Ending_point_-_X"{Ending_point_X = (value as? String)}
                    if name == "Ending_point_-_Y"{Ending_point_Y = (value as? String)}
                    if name == "Fax"{Fax = (value as? String)}
                    if name == "Hiking_Maps_and_Topographic"{Hiking_Maps_and_Topographic = (value as? String)}
                    if name == "Interest_Areas"{Interest_Areas = (value as? String)}
                    if name == "Near_To"{Near_To = (value as? String)}
                    if name == "Number_of_Days"{Number_of_Days = (value as? String)}
                    if name == "Parking"{Parking = (value as? String)}
                    if name == "Phone"{Phone = (value as? String)}
                    if name == "Precautions"{Precautions = (value as? String)}
                    if name == "Region"{Region = (value as? String)}
                    if name == "Special_Equipment"{Special_Equipment = (value as? String)}
                    if name == "Starting_Point"{Starting_Point = (value as? String)}
                    if name == "Starting_point_-_X"{
                        if let toDouble = value as? String {
                            Starting_point_X = Double(toDouble)
                        }
                    }
                    if name == "Starting_point_-_Y"{
                        if let toDouble = value as? String {
                            Starting_point_Y = Double(toDouble)
                        }
                    }
                    if name == "Suitable_for_Children"{Suitable_for_Children = (value as? String)}
                    if name == "Suitable_for_Picnics"{Suitable_for_Picnics = (value as? String)}
                    if name == "Track_Duration"{Track_Duration = (value as? String)}
                    if name == "Track_Length"{Track_Length = (value as? String)}
                    if name == "Track_Outline"{Track_Outline = (value as? String)}
                    if name == "Track_Type"{Track_Type = (value as? String)}
                    if name == "Trip_Type"{Trip_Type = (value as? String)}
                    if name == "URL1"{URL1 = (value as? String)}
                }
                if test == true {
                listTracks.append(Tracks(Id: Id ?? 0, Name: Name ?? "", ShortDescription: ShortDescription ?? "", FullDescription: FullDescription ?? "", VendorId: VendorId ?? "", Vendor_Name: Vendor_Name ?? "", Product_Url: Product_Url ?? "", Pic_Url: Pic_Url ?? "", Accessibility: Accessibility ?? "", Address: Address ?? "", Admission_Charge: Admission_Charge ?? "", Bathing_Waters: Bathing_Waters ?? "", Best_season: Best_season ?? "", Campsite: Campsite ?? "", City: City ?? "", Difficulty_Level: Difficulty_Level ?? "", Drinkable_Water: Drinkable_Water ?? "", Email: Email ?? "", Ending_Point: Ending_Point ?? "", Ending_point_X: Ending_point_X ?? "", Ending_point_Y: Ending_point_Y ?? "", Fax: Fax ?? "", Hiking_Maps_and_Topographic: Hiking_Maps_and_Topographic ?? "", Interest_Areas: Interest_Areas ?? "", Near_To: Near_To ?? "", Number_of_Days: Number_of_Days ?? "", Parking: Parking ?? "", Phone: Phone ?? "", Precautions: Precautions ?? "", Region: Region ?? "", Special_Equipment: Special_Equipment ?? "", Starting_Point: Starting_Point ?? "", Starting_point_X: Starting_point_X ?? 0.0, Starting_point_Y: Starting_point_Y ?? 0.0, Suitable_for_Children: Suitable_for_Children ?? "", Suitable_for_Picnics: Suitable_for_Picnics ?? "", Track_Duration: Track_Duration ?? "", Track_Length: Track_Length ?? "", Track_Outline: Track_Outline ?? "", Track_Type: Track_Type ?? "", Trip_Type: Trip_Type ?? "", URL: URL1 ?? ""))
                }
            }
            if(listTracks.count > 0){
                completion(true,listTracks)
            }
            }.resume()
        
    }
    typealias JSON = [String: Any]
}
