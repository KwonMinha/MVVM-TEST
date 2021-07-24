//
//  Article.swift
//  MVVM-CollectionView
//
//  Created by 권민하 on 2021/07/24.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
