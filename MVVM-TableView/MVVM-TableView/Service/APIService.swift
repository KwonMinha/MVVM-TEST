//
//  APIService.swift
//  MVVM-TableView
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation

protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http://13.125.216.198:3000" + path
    }
}
