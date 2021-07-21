//
//  Article.swift
//  MVVM-TableView
//
//  Created by 권민하 on 2021/07/22.
//

import Foundation

struct ArticleList: Codable { // 서버에서 받을 JSON 데이터 안에 articles array가 있고 이를 ArticleList로 받을 것
    let articles: [Article]
}

struct Article: Codable { // 배열의 각 값 중에서 필요로 하는 건 title, description만 이기에 Article에 필요한 필드만 적어 줌
    let title: String?
    let description: String?
}
