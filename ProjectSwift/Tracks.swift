//
//  Tracks.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import Foundation
import CoreLocation

class Tracks:Codable  {
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
    var Admission_Charge :String
    var Bathing_Waters :String
    var Best_season :String
    var Campsite :String
    var City :String
    var Difficulty_Level :String
    var Drinkable_Water :String
    var Email :String
    var Ending_Point :String
    var Ending_point_X :String
    var Ending_point_Y :String
    var Fax :String
    var Hiking_Maps_and_Topographic :String
    var Interest_Areas :String
    var Near_To :String
    var Number_of_Days  :String
    var Parking :String
    var Phone :String
    var Precautions :String
    var Region :String
    var Special_Equipment :String
    var Starting_Point :String
    var Starting_point_X :Double
    var Starting_point_Y :Double
    var Suitable_for_Children :String
    var Suitable_for_Picnics :String
    var Track_Duration :String
    var Track_Length :String
    var Track_Outline :String
    var Track_Type :String
    var Trip_Type :String
    var URL :String

    
    init(Id :Int,Name :String,ShortDescription  :String,FullDescription  :String,VendorId : String ,Vendor_Name :String,Product_Url :String, Pic_Url :String,Accessibility  :String,Address  :String,Admission_Charge :String,Bathing_Waters :String,Best_season :String,Campsite :String, City :String,Difficulty_Level :String,Drinkable_Water :String, Email :String, Ending_Point :String,Ending_point_X :String,Ending_point_Y :String,Fax :String, Hiking_Maps_and_Topographic :String,Interest_Areas :String, Near_To :String, Number_of_Days :String, Parking :String, Phone :String,Precautions :String, Region :String, Special_Equipment :String,Starting_Point :String,Starting_point_X :Double,Starting_point_Y :Double, Suitable_for_Children :String, Suitable_for_Picnics :String, Track_Duration :String,Track_Length :String,Track_Outline :String, Track_Type :String,Trip_Type :String, URL :String) {
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
        self.Admission_Charge = Admission_Charge
        self.Bathing_Waters = Bathing_Waters
        self.Best_season = Best_season
        self.Campsite = Campsite
        self.City = City
        self.Difficulty_Level = Difficulty_Level
        self.Drinkable_Water = Drinkable_Water
        self.Email = Email
        self.Ending_Point = Ending_Point
        self.Ending_point_X = Ending_point_X
        self.Ending_point_Y = Ending_point_Y
        self.Fax = Fax
        self.Hiking_Maps_and_Topographic = Hiking_Maps_and_Topographic
        self.Interest_Areas = Interest_Areas
        self.Near_To = Near_To
        self.Number_of_Days = Number_of_Days
        self.Parking = Parking
        self.Phone = Phone
        self.Precautions = Precautions
        self.Region = Region
        self.Special_Equipment = Special_Equipment
        self.Starting_Point = Starting_Point
        self.Starting_point_X = Starting_point_X
        self.Starting_point_Y = Starting_point_Y
        self.Suitable_for_Children = Suitable_for_Children
        self.Suitable_for_Picnics = Suitable_for_Picnics
        self.Track_Duration = Track_Duration
        self.Track_Length = Track_Length
        self.Track_Outline = Track_Outline
        self.Track_Type = Track_Type
        self.Trip_Type = Trip_Type
        self.URL = URL
        
    }
    func getName() -> String {
        return Name
    }
    func getPicUrl() -> String {
        return Pic_Url
    }
    var location:CLLocation{
        return CLLocation(latitude: Starting_point_Y, longitude: Starting_point_X)
    }
}
struct FavoritesTracks {
    let track : Tracks
    var hasFavorited :Bool
    
}
