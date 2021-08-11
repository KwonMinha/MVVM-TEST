//
//  SecondArticleService.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation
import Alamofire

protocol SecondArticleServiceProtocol: AnyObject {
    func getArticleList(completion: @escaping (([ArticleList]?) -> Void))
}

class SecondArticleService: SecondArticleServiceProtocol {
    
    static let shared = SecondArticleService()
    
    func getArticleList(completion: @escaping (([ArticleList]?) -> Void)) {
       
        let URL = APIConstants.ProductionServer.baseURL
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     parameters: nil,
                                     encoding: JSONEncoding.default,
                                     headers: nil)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let value = dataResponse.value else { return }
                let articleData = try? JSONDecoder().decode(ArticleListModel.self, from: value)
                completion(articleData?.articleList)
            case.failure(let error):
                print(error.errorDescription ?? "")
            }
        }
    }
    
}
