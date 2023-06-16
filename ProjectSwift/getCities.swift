//
//  getCities.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 22/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit

struct getCities{
    
    
    func readJsonHttp(completion: @escaping (_ success: Bool, _ list: [CommunityAndCities]) -> Void){
        var listCommunityAndCities = [CommunityAndCities]()
        var id:Int?
        var Name:String?
        var FullDescription:String?
        var VendorName:String?
        var ProductUrl:String?
        var PicUrl:String?
        var FAQ:String?
        var Region:String?
        var X:Double?
        var Y:Double?
        var Youtube:String?
        let http  = "https://firebasestorage.googleapis.com/v0/b/projectswift-14d3c.appspot.com/o/CommunityAndCitiesSQLiteDB.json?alt=media&token=10480709-9b9e-4096-b789-686ae3548cbc"
        
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
                    if name == "FullDescription"{FullDescription = (value as? String)}
                    if name == "VendorName"{VendorName = (value as? String)}
                    if name == "ProductUrl"{ProductUrl = (value as? String)}
                    if name == "PicUrl"{PicUrl = (value as? String)}
                    if name == "FAQ"{FAQ = (value as? String)}
                    if name == "Region"{Region = (value as? String)}
                    if name == "X"{X = (value as? Double)}
                    if name == "Y"{Y = (value as? Double)}
                    if name == "Youtube"{Youtube = (value as? String)}
                    
                    
                }
                listCommunityAndCities.append(CommunityAndCities(Id: id ?? 0, Name: Name ?? "", FullDescription: FullDescription ?? "", VendorName: VendorName ?? "", ProductUrl: ProductUrl ?? "", PicUrl: PicUrl ?? "", FAQ: FAQ ?? "", Region: Region ?? "", X: X ?? 0.0, Y: Y ?? 0.0, Youtube: Youtube ?? ""))
            }
            if(listCommunityAndCities.count > 0){
                completion(true,listCommunityAndCities)
            }
        }.resume()
        
    }
    typealias JSON = [String: Any]
}
