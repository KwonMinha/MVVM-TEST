//
//  Enum+APIError.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation

enum APIError: Error {
    
    case invalidURL
    case requestFailed
    case networkFailed
    case decodingFailed
    case dataFailed
    
    public var localized: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .requestFailed:
            return "요청에 실패하였습니다."
        case .networkFailed:
            return "통신에 실패하였습니다."
        case .decodingFailed:
            return "디코딩에 실패하였습니다."
        case .dataFailed:
            return "잘못된 데이터입니다."
        }
    }
}

enum LoginHandler {
    case failedHandler
    
    var statusCode: Int {
        switch self {
        case .failedHandler:
            return 404
        }
    }
}

