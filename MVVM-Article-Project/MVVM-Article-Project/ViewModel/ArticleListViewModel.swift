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
    
    var service: ArticleServiceProtocol?
    var dataSource: GenericDataSource<ArticleList>?
    var onErrorHandling : ((APIError?) -> Void)?
    
    // MARK: - Initializer
    
    init(service: ArticleServiceProtocol, dataSource: GenericDataSource<ArticleList>?) {
        self.service = service
        self.dataSource = dataSource
    }
    
    func fetchArticleList() {
        guard let service = service else {
            onErrorHandling?(APIError.networkFailed)
            return
        }
        
        service.getArticleList(completion: { (response) in
            DispatchQueue.main.async {
                switch(response) {
                case .success(let data):
                    if let mainData = data as? [ArticleList] {
                        self.dataSource?.data.value = mainData
                    }
                case .requestErr(let message):
                    print("requestERR", message)
                case .pathErr:
                    print("pathERR")
                case .serverErr:
                    print("serverERR")
                case .networkFail:
                    print("networkERR")
                }
            }
        })
    }
    
}
