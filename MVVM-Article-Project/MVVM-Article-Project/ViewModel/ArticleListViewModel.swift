//
//  ArticleListViewModel.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation
import Alamofire

class ArticleListViewModel {
    
    // MARK: - Properties
    var apiClient: APIClient2
    var dataSource: GenericDataSource<ArticleList>?
    var onError: ((String) -> ())?
    
    /// Property with didSet to notify error message on network response failure
    
    var errorMessage: String = "" {
        didSet {
            onError?(errorMessage)
        }
    }
    
    // MARK: - Initializer
    
    init(apiClient: APIClient2, dataSource: GenericDataSource<ArticleList>?) {
        self.apiClient = apiClient
        self.dataSource = dataSource
    }
    
    func fetchArticleList() {
        
        //APIClient
        
//        APIClient.getArticles{ result in
//            switch result {
//            case .success(let articles):
//                self.dataSource?.data.value = articles.articleList ?? []
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

        //APIClient2
        
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
