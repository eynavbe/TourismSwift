//
//  getFood.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
struct getFood{
    
    
    func readJsonHttp(city :String ,completion: @escaping (_ success: Bool, _ list: [Food]) -> Void){
        var listFood = [Food]()
        var id:Int?
        var Name :String?
        var ShortDescription  :String?
        var FullDescription  :String?
        var VendorId : String?
        var Vendor_Name :String?
        var Product_Url :String?
        var Pic_Url :String?
        var Accessibility  :String?
        var Address  :String?
        var Business_License  :String?
        var Chef_Restaurant  :String?
        var Chefs_Name  :String?
        var City :String?
        var Email :String?
        var Fax :String?
        var First_Name :String?
        var Near_To :String?
        var Opening_Hours :String?
        var Opening_hours_from_Sunday_until_Thursday :String?
        var Opening_hours_on_Friday :String?
        var Opening_hours_on_Saturday :String?
        var Parking :String?
        var Phone :String?
        var Region :String?
        var Restaurant_ :String?
        var Type_of_Kashrut :String?
        var URL1 :String?
        var X :Double?
        var Y :Double?
        var test = true
        let http  = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/JSON_Restaurants.json?alt=media&token=6e35c16a-30a3-4c31-b05d-3b5eee4f2698"
        
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
                    if name == "Business_License"{Business_License = (value as? String)}
                    if name == "Chef_Restaurant"{Chef_Restaurant = (value as? String)}
                    if name == "Chefs_Name"{Chefs_Name = (value as? String)}
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
                    if name == "First_Name"{First_Name = (value as? String)}
                    if name == "Near_To"{Near_To = (value as? String)}
                    if name == "Opening_Hours"{Opening_Hours = (value as? String)}
                    if name == "Opening_hours_from_Sunday_until_Thursday"{Opening_hours_from_Sunday_until_Thursday = (value as? String)}
                    if name == "Opening_hours_on_Friday"{Opening_hours_on_Friday = (value as? String)}
                    if name == "Opening_hours_on_Saturday"{Opening_hours_on_Saturday = (value as? String)}
                    if name == "Parking"{Parking = (value as? String)}
                    if name == "Phone"{Phone = (value as? String)}
                    if name == "Region"{Region = (value as? String)}
                    if name == "Restaurant_"{Restaurant_ = (value as? String)}
                    if name == "Type_of_Kashrut"{Type_of_Kashrut = (value as? String)}
                    if name == "URL1"{URL1 = (value as? String)}
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
                listFood.append(Food(Id: id ?? 0, Name: Name ?? "", ShortDescription: ShortDescription ?? "", FullDescription: FullDescription ?? "", VendorId: VendorId ?? "", Vendor_Name: Vendor_Name ?? "", Product_Url: Product_Url ?? "", Pic_Url: Pic_Url ?? "", Accessibility: Accessibility ?? "", Address: Address ?? "", Business_License: Business_License ?? "", Chef_Restaurant: Chef_Restaurant ?? "", Chefs_Name: Chefs_Name ?? "", City: City ?? "", Email: Email ?? "", Fax: Fax ?? "", First_Name: First_Name ?? "", Near_To: Near_To ?? "", Opening_Hours: Opening_Hours ?? "", Opening_hours_from_Sunday_until_Thursday: Opening_hours_from_Sunday_until_Thursday ?? "", Opening_hours_on_Friday: Opening_hours_on_Friday ?? "", Opening_hours_on_Saturday: Opening_hours_on_Saturday ?? "", Parking: Parking ?? "", Phone: Phone ?? "", Region: Region ?? "", Restaurant_: Restaurant_ ?? "", Type_of_Kashrut: Type_of_Kashrut ?? "", URL: URL1 ?? "", X: X ?? 0.0, Y: Y ?? 0.0))
                }
            }
            if(listFood.count > 0){
                completion(true,listFood)
            }
            }.resume()
        
    }
    typealias JSON = [String: Any]
}
