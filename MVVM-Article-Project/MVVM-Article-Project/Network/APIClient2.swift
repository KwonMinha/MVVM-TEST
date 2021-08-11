//
//  APIClient2.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/09.
//

import Foundation
import Alamofire

class APIClient2: APIClientProtocol {
    
    @discardableResult
    func performRequest<T>(route: APIRouter, completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest where T : Decodable {
        return AF.request(route)
            .responseDecodable { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
    
    func getArticles(completion: @escaping (Result<ArticleListModel, AFError>) -> Void) {
        performRequest(route: APIRouter.articles, completion: completion)
    }
    
}