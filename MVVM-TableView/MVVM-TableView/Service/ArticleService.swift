//
//  ArticleService.swift
//  MVVM-TableView
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class ArticleService: APIService {
    
    /*
    static func getArticles2(completion: @escaping([Article]?) -> Void) {
        let URL = url("/api/home")
        
        AF.request(URL,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil).responseData { response in
                    
                    switch response.result {
                    
                    case .success:
                        
                        guard let value = response.value else { return }
                        let articleData = try? JSONDecoder().decode(ArticleList.self, from: value)
                        completion(articleData?.articles)
                        
                    case.failure(let error):
                        print(error.errorDescription ?? "")
                    }
                   }
        
    }
    */
    
    
    static func getArticles(completion: @escaping([Article]?) -> Void) {
        let URL = url("/api/home")
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     parameters: nil,
                                     encoding: JSONEncoding.default,
                                     headers: nil)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            
            case .success:
                
                guard let value = dataResponse.value else { return }
                let articleData = try? JSONDecoder().decode(ArticleList.self, from: value)
                completion(articleData?.articles)
                
            case.failure(let error):
                print(error.errorDescription ?? "")
            }
        }
        
    }
    
}
