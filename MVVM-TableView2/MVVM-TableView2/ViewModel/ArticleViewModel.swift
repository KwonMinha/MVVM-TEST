//
//  ArticleViewModel.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation

struct ArticleViewModel {
    var title: String
    var description: String
}

extension ArticleViewModel {
    init(article :Article) {
        self.title = article.title
        self.description = article.description
    }
}

struct ArticleListViewModel {
    var title: String? = "Articles"
    var articles: [ArticleViewModel] = [ArticleViewModel]()
}

extension ArticleListViewModel {
    init(articles :[ArticleViewModel]) {
        self.articles = articles
    }
    
}
