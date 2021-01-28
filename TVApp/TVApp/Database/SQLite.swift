//
//  SQLite.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/28.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import SQLite3
import Foundation

class SQLite {

    var db: OpaquePointer? = nil
    
    func openDB() -> Bool {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Favorite.sqlite")
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            return true
        }
        else {
            return false
        }
        
    }
    
    //original: clip.id, clip.title, channel.name
    //live: live.id, live.title, channel.name
    func createTable() -> Bool{
        
        let createTableQuery = """
        create table if not exists Favorite(
        ID integer primary key,
        TITLE text,
        CHANNEL text
        )
        """
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
            return true
        }
        return false
        
    }
    
    func addCartItem(favorite: Favorite) -> Bool {
        
        let insertQuery = "insert into Favorite (ID, TITLE, CHANNEL) values (?,?,?)"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insertStatement, 1, Int32(favorite.id))
            sqlite3_bind_text(insertStatement, 2, (favorite.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (favorite.channel as NSString).utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                return true
            }
            
        }
        return false
        
    }
    
    func getAllFavorites() -> [Favorite] {
        
        var favoriteList = [Favorite]()
        let selectQuery = "select * from Favorite"
        var selectStatement: OpaquePointer? = nil
        if sqlite3_prepare(db, selectQuery, -1, &selectStatement, nil) == SQLITE_OK {
            
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                let id = Int(sqlite3_column_int(selectStatement, 0))
                let title = String(cString: sqlite3_column_text(selectStatement, 1))
                let channel = String(cString: sqlite3_column_text(selectStatement, 2))
                favoriteList.append(Favorite(id, title, channel))
            }
            
        }
        
        return favoriteList
        
    }
    
    func deleteFavorite(favorite: Favorite) -> Bool {
        
        let deleteAllQuery = "delete from Favorite where id = \(favorite.id)"
        if sqlite3_exec(db, deleteAllQuery, nil, nil, nil) == SQLITE_OK {
            return true
        }
        return false
        
    }
    
    func deleteTable() -> Bool{
        
        let deleteTableQuery = "drop table Favorite"
        if sqlite3_exec(db, deleteTableQuery, nil, nil, nil) == SQLITE_OK {
            return true
        }
        return false
        
    }
    
    func closeDB() {
        sqlite3_close(db)
    }
    
}
