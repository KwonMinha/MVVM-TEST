//
//  ArticleListModel.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation

struct ArticleListModel: Codable {
    
    var articleList: [ArticleList]?
    
    init(articleList : [ArticleList]){
        self.articleList = articleList
    }
    
    enum CodingKeys: String, CodingKey {
        case articleList = "articles"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articleList = try values.decodeIfPresent([ArticleList].self, forKey: .articleList)
    }
    
}
