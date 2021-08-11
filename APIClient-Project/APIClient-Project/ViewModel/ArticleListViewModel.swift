//
//  ArticleListViewModel.swift
//  APIClient-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation
import Alamofire

class ArticleListViewModel {
    
    // MARK: - Properties
    
    //var apiClient: APIClientProtocol
    var apiClient: APIClient
    var dataSource: GenericDataSource<ArticleList>?
    var onError: ((String) -> ())?
    
    var errorMessage: String = "" {
        didSet {
            onError?(errorMessage)
        }
    }
    
    // MARK: - Initializer
    
    //apiClient: APIClientProtocol = APIClient()
    init(apiClient: APIClient, dataSource: GenericDataSource<ArticleList>?) {
        self.apiClient = apiClient
        self.dataSource = dataSource
    }
    
    func fetchArticleList() {
        
          //[weak self] Error
//        apiClient.getArticles { [weak self] result in
//            switch result {
//            case .success(let articles):
//                self.dataSource?.data.value = articles.articleList ?? []
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
         
         apiClient.getArticles { result in
             switch result {
             case .success(let articles):
                 self.dataSource?.data.value = articles.articleList ?? []
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
        
    }
}
