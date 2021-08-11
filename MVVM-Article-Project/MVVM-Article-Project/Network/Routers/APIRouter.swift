//
//  APIRouter.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(email:String, password:String)
    case articles
    case post(id: Int)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .articles, .post:
            return .get
        }
    }
    
    // MARK: - Path
    
    private var path: String {
        switch self {
        case .login:
            return "/login"
        case .articles:
            return ""
        case .post(let id):
            return "/posts/\(id)"
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            //return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
            return [email: "email", password: "password"]
        case .articles, .post:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(APIConstants.Values.applicationJSON.rawValue, forHTTPHeaderField: APIConstants.Header.contentType.rawValue)
        urlRequest.setValue(APIConstants.Values.applicationJSON.rawValue, forHTTPHeaderField: APIConstants.Header.accept.rawValue)
        
        
        /*
        // Constans 사용
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        */
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
