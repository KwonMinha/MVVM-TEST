//
//  APIConstants.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation

// MARK: 해당 파일 안에는 API 관련 상수들을 추가해주세요!!
// - 싱글턴으로 변수를 생성해주세요.
// - ex. static let baseURL = "https://www.example.com"
struct APIConstants {
    // MARK: - Headers
    
    static let authorization = "Authorization"
    static let accept = "Accept"
    static let auth = "x-auth-token"
    static let contentType = "Content-Type"

    // MARK: - Values
    
    static let applicationJSON = "application/json"
    static let formEncoded = "application/x-www-form-urlencoded"

    // MARK: - Keys
    
    static let jwtToken = ""
    
    // MARK: - URLs
    
    // Base URL
    static let baseURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040"

    // MARK: - /travel URLs
    static let tripURL = baseURL + "/travel"
    static let editTripURL = baseURL + "/travel/:groupId"
}
