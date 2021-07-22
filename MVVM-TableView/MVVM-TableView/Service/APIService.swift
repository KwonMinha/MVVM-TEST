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
        return "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040" + path
    }
}
