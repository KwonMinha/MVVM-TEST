//
//  NetworkResult.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/11.
//


import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
    /*
    public var localized: String {
        switch self {
        case .requestErr(let message):
            return "requestErr \(message)"
        case .networkFail:
            return "networkERR"
        case .serverErr:
            return "serverERR"
        case .pathErr:
            return "pathERR"
        case .success(let message):
            return "success \(message)"
        }
    }
    */

}
