//
//  APIConstants.swift
//  APIClient-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation

struct APIConstants {
    struct ProductionServer {
        static let baseURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040"
        static let urlVersion = "v1/"
    }
    
    struct APIParameterKey {
        static let email = "email"
        static let password = "password"
    }
    
    // MARK: - Keys

    static let jwtToken = ""
    
}

// MARK: - Headers

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

// MARK: - ContentType

enum ContentType: String {
    case json = "application/json"
    case formEncoded = "application/x-www-form-urlencoded"
}
