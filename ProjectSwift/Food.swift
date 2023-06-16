//
//  Food.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import Foundation
import CoreLocation
class Food:Codable {
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
    var Business_License  :String
    var Chef_Restaurant  :String
    var Chefs_Name  :String
    var City :String
    var Email :String
    var Fax :String
    var First_Name :String
    var Near_To :String
    var Opening_Hours :String
    var Opening_hours_from_Sunday_until_Thursday :String
    var Opening_hours_on_Friday :String
    var Opening_hours_on_Saturday :String
    var Parking :String
    var Phone :String
    var Region :String
    var Restaurant_ :String
    var Type_of_Kashrut :String
    var URL :String
    var X :Double
    var Y :Double
    
    init(Id :Int,Name :String,ShortDescription  :String,FullDescription  :String,VendorId : String ,Vendor_Name :String,Product_Url :String, Pic_Url :String,Accessibility  :String,Address  :String,Business_License  :String,Chef_Restaurant  :String,Chefs_Name  :String, City :String, Email :String,Fax :String,First_Name :String, Near_To :String,  Opening_Hours :String,Opening_hours_from_Sunday_until_Thursday :String, Opening_hours_on_Friday :String,Opening_hours_on_Saturday :String, Parking :String, Phone :String, Region :String, Restaurant_ :String,Type_of_Kashrut :String, URL :String, X :Double,Y :Double) {
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
        self.Business_License = Business_License
        self.Chef_Restaurant = Chef_Restaurant
        self.Chefs_Name = Chefs_Name
        self.City = City
        self.Email = Email
        self.Fax = Fax
        self.First_Name = First_Name
        self.Near_To = Near_To
        self.Opening_Hours = Opening_Hours
        self.Opening_hours_from_Sunday_until_Thursday = Opening_hours_from_Sunday_until_Thursday
        self.Opening_hours_on_Friday = Opening_hours_on_Friday
        self.Opening_hours_on_Saturday = Opening_hours_on_Saturday
        self.Parking = Parking
        self.Phone = Phone
        self.Region = Region
        self.Restaurant_ = Restaurant_
        self.Type_of_Kashrut = Type_of_Kashrut
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
struct FavoritesFood {
    let food : Food
    var hasFavorited :Bool
    
}
