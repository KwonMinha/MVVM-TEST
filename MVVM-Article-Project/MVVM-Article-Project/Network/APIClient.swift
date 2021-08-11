//
//  APIClient.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/09.
//

import Foundation
import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, completion:@escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable { (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func getArticles(completion:@escaping (Result<ArticleListModel, AFError>) -> Void) {
        performRequest(route: APIRouter.articles, completion: completion)
    }
    
}
