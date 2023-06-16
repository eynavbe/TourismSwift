////
////  File.swift
////  ProjectSwift
////
////  Created by Eynav Ben Shlomo on 16/07/2019.
////  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
////
//
//import Foundation
//import SQLite
//
//
//struct Fille {
//    let db = try! Connection("CommunityAndCitiesSQLiteDB.db")
//    let users = Table("CommunityAndCitiesSQLiteDB")
//    let Id = Expression<Int64>("Id")
//    let Name = Expression<String?>("Name")
//    let FullDescription = Expression<String>("FullDescription")
//    let VendorName = Expression<String>("VendorName")
//    let ProductUrl = Expression<String>("ProductUrl")
//    let PicUrl = Expression<String>("PicUrl")
//    let FAQ = Expression<String>("FAQ")
//    let Region = Expression<String>("Region")
//    let X = Expression<Double>("X")
//    let Y = Expression<Double>("Y")
//    let Youtube = Expression<String>("Youtube")
//
//    
//    func cc()->Void {
//        try! db.run(users.create { t in
//            t.column(Id, primaryKey: true)
//            t.column(Name)
//            t.column(FullDescription, unique: true)
//        })
//        for user in try! db.prepare(users) {
//            print("id: \(user[Id]), name: \(String(describing: user[Name])), email: \(user[FullDescription])")
//            // id: 1, name: Optional("Alice"), email: alice@mac.com
//        }
//    }
////    try! db.run(users.create { t in
////    t.column(Id, primaryKey: true)
////    t.column(Name)
////    t.column(FullDescription, unique: true)
////    })
//    // CREATE TABLE "users" (
//    //     "id" INTEGER PRIMARY KEY NOT NULL,
//    //     "name" TEXT,
//    //     "email" TEXT NOT NULL UNIQUE
//    // )
//    
//
////    let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
////    let rowid = try db.run(insert)
//    // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
////    for user in try db.prepare(users) {
////    print("id: \(CommunityAndCitiesSQLiteDB.db[id]), name: \(CommunityAndCitiesSQLiteDB.db[name]), email: \(CommunityAndCitiesSQLiteDB.db[email])")
////    // id: 1, name: Optional("Alice"), email: alice@mac.com
////    }    // SELECT * FROM "users"
//
////    let alice = users.filter(id == rowid)
////
////    try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
////    // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
////    // WHERE ("id" = 1)
////
////    try db.run(alice.delete())
////    // DELETE FROM "users" WHERE ("id" = 1)
////
////    try db.scalar(users.count) // 0
////    // SELECT count(*) FROM "users"
//
//}
