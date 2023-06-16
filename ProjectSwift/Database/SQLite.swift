////
////  SQLite.swift
////  ProjectSwift
////
////  Created by Eynav Ben Shlomo on 16/07/2019.
////  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
////
//
//import Foundation
//import SQLite
//
//class SQLite {
////    static let shared = SQLite()
////    public let connection: Connection?
////    public let databaseFileName = "CommunityAndCitiesSQLiteDB.db"
////    private init(){
////        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String?
////        do{
////            connection = try Connection("\(dbPath!)/(databaseFileName)")
////        }catch{
////            connection = nil
////            let nserror = error as NSError
////            print("canot connect to database. Error is: \(nserror), \(nserror.userInfo)")
////
////        }
////
////    }
//    
//    static func read(){
//        guard let url = Bundle.main.url(forResource: "CommunityAndCitiesSQLiteDB", withExtension: "db") else {return}
//        
//        guard let data = try? Data(contentsOf: url) else {return}
//        print(data)
//    }
//}
