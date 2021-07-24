//
//  ArticleViewModel.swift
//  MVVM-CollectionView
//
//  Created by 권민하 on 2021/07/24.
//

import Foundation

class ArticleViewModel {
    var articles: Dynamic<[Article]> = Dynamic([])
    
    func fetchArticles() {
        ArticleService.getArticles { (articles) in
            if let articles = articles {
                self.articles.value = articles
                return
            }
        }
    }
    
    
}
