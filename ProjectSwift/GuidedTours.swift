//
//  GuidedTours.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 29/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import Foundation
import CoreLocation

class GuidedTours:Codable {
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
    var By_Appointment :String
    var Car :String
    var City :String
    var Comments :String
    var Departure_hours :String
    var Email :String
    var Ending_Point :String
    var Ending_point_X :String
    var Ending_point_Y :String
    var Fax :String
    var Language :String
    var Leaving_Time :String
    var Near_To :String
    var Opening_Hours :String
    var Operator :String
    var Parking :String
    var Phone :String
    var Region :String
    var Registration_Form :String
    var Starting_Point :String
    var Starting_point_X :Double
    var Starting_point_Y :Double
    var Suitable_for_Children :String
    var URL :String
   
    
    init(Id :Int,Name :String,ShortDescription  :String,FullDescription  :String,VendorId : String ,Vendor_Name :String,Product_Url :String, Pic_Url :String,Accessibility  :String,Address  :String,Admission_Charge :String,By_Appointment :String,Car :String, City :String,Comments :String,Departure_hours :String, Email :String,Ending_Point :String, Ending_point_X :String,Ending_point_Y :String,Fax :String,Language :String,Leaving_Time :String, Near_To :String, Opening_Hours :String,Operator :String, Parking :String, Phone :String, Region :String,Registration_Form :String,Starting_Point :String,Starting_point_X :Double,Starting_point_Y :Double, Suitable_for_Children :String, URL :String) {
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
        self.By_Appointment = By_Appointment
        self.Car = Car
        self.City = City
        self.Comments = Comments
        self.Departure_hours = Departure_hours
        self.Email = Email
        self.Ending_Point = Ending_Point
        self.Ending_point_X = Ending_point_X
        self.Ending_point_Y = Ending_point_Y
        self.Fax = Fax
        self.Language = Language
        self.Leaving_Time = Leaving_Time
        self.Near_To = Near_To
        self.Opening_Hours = Opening_Hours
        self.Operator = Operator
        self.Parking = Parking
        self.Phone = Phone
        self.Region = Region
        self.Registration_Form = Registration_Form
        self.Starting_Point = Starting_Point
        self.Starting_point_X = Starting_point_X
        self.Starting_point_Y = Starting_point_Y
        self.Suitable_for_Children = Suitable_for_Children
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
struct FavoritesGuidedTours {
    let guidedTours : GuidedTours
    var hasFavorited :Bool
    
}
