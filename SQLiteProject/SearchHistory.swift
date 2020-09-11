//
//  SearchHistory.swift
//  SQLiteProject
//
//  Created by 사용자 on 2020/09/11.
//  Copyright © 2020 mjlim. All rights reserved.
//

import Foundation
import SQLite

struct SearchHistory: Codable {
    var id: Int?
    let time: Date              // 검색 시간
    let keyword: String         // 검색 키워드
    let configure: String    // 일반/특가 구분자 G: 일반 , S: 특가

}
