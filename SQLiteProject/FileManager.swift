//
//  FileManager.swift
//  SQLiteProject
//
//  Created by 사용자 on 2020/09/11.
//  Copyright © 2020 mjlim. All rights reserved.
//

import Foundation
import SQLite

struct FileManagerSub {
    static let shared = FileManagerSub()
    private init(){}
    
    func getDBPath()-> String {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let userUrl = documentDirectory.appendingPathComponent("user").appendingPathExtension("sqlite3") //filename name.sqlite3
        return userUrl.path
    }

}
