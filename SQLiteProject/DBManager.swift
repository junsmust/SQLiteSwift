//
//  SqlWorker.swift
//  SQLiteProject
//
//  Created by 사용자 on 2020/09/11.
//  Copyright © 2020 mjlim. All rights reserved.
//

import Foundation
import SQLite

class DBManager: NSObject {
    let searchHistoryTable = Table("SearchHistory")
    
    var database: Connection? = {
        do {
            let database = try Connection(FileManagerSub.shared.getDBPath())
            return database
        }
        catch {
            return nil
        }
    }()
    func createTable() {
    
        if let database = database {
            let createTable = searchHistoryTable.create { (table) in
                table.column(getColum(key: "id", t: Int.self), primaryKey: .autoincrement)
                table.column(getColum(key: "time", t: Date.self))
                table.column(getColum(key: "keyword", t: String.self))
                table.column(getColum(key: "configure", t: String.self))
            }
            do {
                try database.run(createTable)
                print("Create table")
            }
            catch {
                print(error)
            }
        }
        else {
            createDatabase()
        }
    }
    func createDatabase() {
        do {
            database = try Connection(FileManagerSub.shared.getDBPath())
        }catch {
            print(error.localizedDescription)
        }
    }
    func readRow() {
        if let database = database {
            for user in try! database.prepare(searchHistoryTable) {
                print(try! "\(user.get(getColum(key: "id", t: Int.self)))      time  \(user.get(getColum(key: "time", t: Date.self)))         \(user.get(getColum(key: "keyword", t: String.self)))   ")
            }
        }
        else {
            createDatabase()
        }
    }
    
    func updateRow(id: Int) {
        if let database = database {
            let rowForUpdate = searchHistoryTable.filter(getColum(key: "id", t: Int.self) == id)
            let statement = rowForUpdate.update(getColum(key: "keyword", t: String.self) <- "Test is a ss Test Man")
            do {
                try database.run(statement)
                readRow()
            }catch {
                print("error  \(error.localizedDescription)")
            }
        }
    }
    
    func deleteRow(id: Int) {
        if let database = database {
            let rowForDelete = searchHistoryTable.filter(getColum(key: "id", t: Int.self) == id)
            let statement = rowForDelete.delete()
            do {
                try database.run(statement)
                readRow()
            }catch {
                print("error  \(error.localizedDescription)")
            }
        }
    }
    
    func insertRow(searchVO: SearchHistory) {
        if let database = database {
            let insertStatement = searchHistoryTable.insert (
                getColum(key: "time", t: Date.self) <- searchVO.time ,
                getColum(key: "keyword", t: String.self) <- searchVO.keyword ,
                getColum(key: "configure", t: String.self) <- searchVO.configure )
            do {
                try database.run(insertStatement)
                print("Insert row succeed")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    func getColum<T>(key: String , t: T.Type)-> Expression<T> {
        return Expression<T>(key)
    }
    func deleteRow(seq: Int) {
        
    }
    func updateRow<T>(seq: Int , searchVO: T) {
        
    }
  
    func selectRow<T>(searchVO: T)-> T {
        return searchVO
    }
    func selectRows<T>(searchVO: T)-> [T] {
        return [searchVO]
    }
}
