//
//  Extension.swift
//  MVVM-TableView
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation

func gsno(_ data: String?) -> String {
    guard let str = data else {
        return ""
    }
    return str
}

func gino(_ data: Int?) -> Int {
    guard let num = data else {
        return 0
    }
    return num
}
