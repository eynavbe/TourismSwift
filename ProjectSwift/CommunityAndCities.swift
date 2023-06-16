////
////  CommunityAndCities.swift
////  ProjectSwift
////
////  Created by Eynav Ben Shlomo on 16/07/2019.
////  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
////
//
import Foundation
//import SQLite
//
class CommunityAndCities {
     var Id :Int
     var Name :String
     var FullDescription  :String
     var VendorName :String
     var ProductUrl :String
     var PicUrl :String
     var FAQ :String
     var Region :String
     var X :Double
     var Y :Double
     var Youtube :String
    
    init(Id :Int,Name :String,FullDescription  :String,VendorName :String,ProductUrl :String, PicUrl :String,FAQ :String,Region :String,X :Double,Y :Double,Youtube :String) {
        self.Id = Id
        self.Name = Name
        self.FullDescription = FullDescription
        self.VendorName = VendorName
        self.ProductUrl = ProductUrl
        self.PicUrl = PicUrl
        self.FAQ = FAQ
        self.Region = Region
        self.X = X
        self.Y = Y
        self.Youtube = Youtube
    }
    func getName() -> String {
        return Name
    }
    func getPicUrl() -> String {
        return PicUrl
    }
}
