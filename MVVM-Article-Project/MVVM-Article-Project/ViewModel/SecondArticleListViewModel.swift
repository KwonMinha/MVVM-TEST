//
//  SecondArticleListViewModel.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation
import Alamofire

class SecondArticleListViewModel {
    
    // MARK: - Properties
    
    var articlList: Dynamic<[ArticleList]> = Dynamic([])
    var apiClient: SecondArticleServiceProtocol?
    var onErrorHandling : ((APIError?) -> Void)?
    
    // MARK: - Initializer
    
    init(apiClient: SecondArticleServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchArticleList() {
        
        guard let service = apiClient else {
            onErrorHandling?(APIError.networkFailed)
            return
        }
        
        service.getArticleList { (response) in
            if let articleData = response {
                self.articlList.value.append(contentsOf: articleData)
                return
            }
        }
    }
    
}
