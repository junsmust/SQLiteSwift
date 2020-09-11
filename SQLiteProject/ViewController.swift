//
//  ViewController.swift
//  SQLiteProject
//
//  Created by 사용자 on 2020/09/11.
//  Copyright © 2020 mjlim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createAction(_ sender: Any) {
        dbManager.createTable()
    }
    
    @IBAction func insertAction(_ sender: Any) {
        dbManager.insertRow(searchVO: SearchHistory(time: Date(), keyword: "test input", configure: "G"))
        dbManager.updateRow(id: 3)
        
    }
}

