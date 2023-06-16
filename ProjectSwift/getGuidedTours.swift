//
//  getGuidedTours.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
struct getGuidedTours{
    
    
    func readJsonHttp(city :String ,completion: @escaping (_ success: Bool, _ list: [GuidedTours]) -> Void){
        var listGuidedTours = [GuidedTours]()
        var id:Int?
        var Name:String?
        var ShortDescription :String?
        var FullDescription :String?
        var VendorId : String?
        var Vendor_Name :String?
        var Product_Url :String?
        var Pic_Url :String?
        var Accessibility  :String?
        var Address  :String?
        var Admission_Charge :String?
        var By_Appointment :String?
        var Car :String?
        var City :String?
        var Comments :String?
        var Departure_hours :String?
        var Email :String?
        var Ending_Point :String?
        var Ending_point_X :String?
        var Ending_point_Y :String?
        var Fax :String?
        var Language :String?
        var Leaving_Time :String?
        var Near_To :String?
        var Opening_Hours :String?
        var Operator :String?
        var Parking :String?
        var Phone :String?
        var Region :String?
        var Registration_Form :String?
        var Starting_Point :String?
        var Starting_point_X :Double?
        var Starting_point_Y :Double?
        var Suitable_for_Children :String?
        var URL1 :String?
        var test = true
        let http  = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/JSON_Guided_tours.json?alt=media&token=7f4edd7b-1603-4440-bbfb-c466f3f9a141"
        
        guard let url = URL(string: http) else {return }
        URLSession.shared.dataTask(with: url) {(data,res,err) in
            
            guard let data = data else {return}
            guard let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as? [Any] else{return }
            
            for peopleDict in jsonObject {
                guard let feed = peopleDict as? JSON else{return}
                for (name,value) in feed {
                    //                print("\(name) , \(value)")
                    if name == "Id"{id = (value as? Int)}
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
                    if name == "By_Appointment"{By_Appointment = (value as? String)}
                    if name == "Car"{Car = (value as? String)}
                    if name == "City"{
                        City = (value as? String)
                        if City == city{
                            test = true
                        }else{
                            test = false
                        }
                    }
                    if name == "Comments"{Comments = (value as? String)}
                    if name == "Departure_hours"{Departure_hours = (value as? String)}
                    if name == "Email"{Email = (value as? String)}
                    if name == "Ending_Point"{Ending_Point = (value as? String)}
                    if name == "Ending_point_-_X"{Ending_point_X = (value as? String)}
                    if name == "Ending_point_-_Y"{Ending_point_Y = (value as? String)}
                    if name == "Fax"{Fax = (value as? String)}
                    if name == "Language"{Language = (value as? String)}
                    if name == "Leaving_Time"{Leaving_Time = (value as? String)}
                    if name == "Near_To"{Near_To = (value as? String)}
                    if name == "Opening_Hours"{Opening_Hours = (value as? String)}
                    if name == "Operator"{Operator = (value as? String)}
                    if name == "Parking"{Parking = (value as? String)}
                    if name == "Phone"{Phone = (value as? String)}
                    if name == "Region"{Region = (value as? String)}
                    if name == "Registration_Form"{Registration_Form = (value as? String)}
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
                    if name == "URL1"{URL1 = (value as? String)}
                   
                }
                if test == true {
                listGuidedTours.append(GuidedTours(Id: id ?? 0, Name: Name ?? "", ShortDescription: ShortDescription ?? "", FullDescription: FullDescription ?? "", VendorId: VendorId ?? "", Vendor_Name: Vendor_Name ?? "", Product_Url: Product_Url ?? "", Pic_Url: Pic_Url ?? "", Accessibility: Accessibility ?? "", Address: Address ?? "", Admission_Charge: Admission_Charge ?? "", By_Appointment: By_Appointment ?? "", Car: Car ?? "", City: City ?? "", Comments: Comments ?? "", Departure_hours: Departure_hours ?? "", Email: Email ?? "", Ending_Point: Ending_Point ?? "", Ending_point_X: Ending_point_X ?? "", Ending_point_Y: Ending_point_Y ?? "", Fax: Fax ?? "", Language: Language ?? "", Leaving_Time: Leaving_Time ?? "", Near_To: Near_To ?? "", Opening_Hours: Opening_Hours ?? "", Operator: Operator ?? "", Parking: Parking ?? "", Phone: Phone ?? "", Region: Region ?? "", Registration_Form: Registration_Form ?? "", Starting_Point: Starting_Point ?? "", Starting_point_X: Starting_point_X ?? 0.0, Starting_point_Y: Starting_point_Y ?? 0.0, Suitable_for_Children: Suitable_for_Children ?? "", URL: URL1 ?? ""))
                }
            }
            if(listGuidedTours.count > 0){
                completion(true,listGuidedTours)
            }
            }.resume()
        
    }
    typealias JSON = [String: Any]
}
