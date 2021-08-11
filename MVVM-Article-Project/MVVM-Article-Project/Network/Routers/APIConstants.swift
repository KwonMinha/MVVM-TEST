//
//  APIConstants.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation

struct APIConstants {
    
    // MARK: - Headers
    
    enum Header: String {
        case authorization = "Authorization"
        case accept = "Accept"
        case auth = "x-auth-token"
        case contentType = "Content-Type"
    }

    // MARK: - Values
    
    enum Values: String {
        case applicationJSON = "application/json"
        case formEncoded = "application/x-www-form-urlencoded"
    }

    // MARK: - Keys
    
    static let jwtToken = ""
    
    // MARK: - URLs
    
    // Base URL
    static let baseURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040"
    static let urlVersion = "v1/"
    
    // MARK: - /Main URLs
    
    enum Auth {
        case signIn
        case signUp
        
        var urlString: String {
            switch self {
            case .signIn:
                return "\(APIConstants.baseURL)\(APIConstants.urlVersion)/auth/signin"
            case .signUp:
                return "\(APIConstants.baseURL)\(APIConstants.urlVersion)/auth/signup"
            }
        }
    }
    
    enum Post {
        case main
        case voteDetail
        
        var urlString: String {
            switch self {
            case .main:
                return "\(APIConstants.baseURL)\(APIConstants.urlVersion)/posts?page=pageNum&limit=10"
            case .voteDetail:
                return "\(APIConstants.baseURL)\(APIConstants.urlVersion)/posts/:post_id"
            }
            
        }
    }
    
}
