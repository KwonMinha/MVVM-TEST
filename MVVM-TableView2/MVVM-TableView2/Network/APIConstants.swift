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
    static let inviteCodeURL = baseURL + "/travel/group/:inviteCode"    // 여행 참여, 여행 정보 조회
    static let addTripURL = baseURL + "/travel" // 여행 생성 뷰 post
    static let addTripImageURL = baseURL + "/image" // 여행 생성 뷰 이미지 호출
    static let editTripURL = baseURL + "/travel/:groupId" // 여행 데이터 편집

    // MARK: - /auth/user URLs
    
    // MARK: - /schedule
    static let getSpecificDateURL = baseURL + "/schedule/daily/:groupId/:date"
    static let addPlanURL = baseURL + "/schedule/:groupId"
    static let scheduleURL = baseURL + "/schedule"
    static let getScheduleURL = baseURL + "/schedule/:groupId/:scheduleId"

    // MARK: - /board
    static let boardURL = baseURL + "/board"
    static let postBoardURL = baseURL + "/board/:groupId/:tag"          // 여행 보드 추가
    
}

    // MARK: - URLs
