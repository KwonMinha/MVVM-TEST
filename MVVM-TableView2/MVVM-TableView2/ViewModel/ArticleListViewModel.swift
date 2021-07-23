//
//  ArticleListViewModel.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//
import Foundation

struct ArticleListViewModel {
    var articles: Dynamic<[Article]> = Dynamic([])
}

extension ArticleListViewModel {
    init(articles: [Article]) {
        //self.articles = Dynamic<[ArticleViewModel]>(articles)
        self.articles.value = articles
    }
}

struct ArticleViewModel {
    var title: Dynamic<String> = Dynamic("") // let title = Dynamic("")
    var description = Dynamic("")
}

extension ArticleViewModel {
    init(article: Article) {
        self.title =  Dynamic<String>(article.title)
        self.description =  Dynamic<String>(article.description)
    }
}
