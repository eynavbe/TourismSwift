//
//  Attractions.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import Foundation
import CoreLocation

class Attractions:Codable {
    var Id :Int
    var Name :String
    var ShortDescription  :String
    var FullDescription  :String
    var VendorId : String
    var Vendor_Name :String
    var Product_Url :String
    var Pic_Url :String
    var Accessibility  :String
    var Address  :String
    var Attraction_Type :String
    var Blue_Flag :String
    var City :String
    var Email :String
    var Fax :String
    var Near_To :String
    var Notes_for_opening_hours :String
    var Opening_Hours :String
    var Parking :String
    var Phone :String
    var Region :String
    var Suitable_for_Children :String
    var URL :String
    var X :Double
    var Y :Double
    
    init(Id :Int,Name :String,ShortDescription  :String,FullDescription  :String,VendorId : String ,Vendor_Name :String,Product_Url :String, Pic_Url :String,Accessibility  :String,Address  :String,Attraction_Type :String,Blue_Flag :String, City :String, Email :String,Fax :String, Near_To :String, Notes_for_opening_hours :String, Opening_Hours :String, Parking :String, Phone :String, Region :String, Suitable_for_Children :String, URL :String, X :Double,Y :Double) {
        self.Id = Id
        self.Name = Name
        self.ShortDescription = ShortDescription
        self.FullDescription = FullDescription
        self.VendorId = VendorId
        self.Vendor_Name = Vendor_Name
        self.Product_Url = Product_Url
        self.Pic_Url = Pic_Url
        self.Accessibility = Accessibility
        self.Address = Address
        self.Attraction_Type = Attraction_Type
        self.Blue_Flag = Blue_Flag
        self.City = City
        self.Email = Email
        self.Fax = Fax
        self.Near_To = Near_To
        self.Notes_for_opening_hours = Notes_for_opening_hours
        self.Opening_Hours = Opening_Hours
        self.Parking = Parking
        self.Phone = Phone
        self.Region = Region
        self.Suitable_for_Children = Suitable_for_Children
        self.URL = URL
        self.X = X
        self.Y = Y
    }
    func getName() -> String {
        return Name
    }
    func getPicUrl() -> String {
        return Pic_Url
    }
    var location:CLLocation{
        return CLLocation(latitude: Y, longitude: X)
    }
}
struct FavoritesAttractions {
    let attraction : Attractions
    var hasFavorited :Bool
  
}
