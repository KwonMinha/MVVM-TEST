//
//  ArticleList.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation

struct ArticleList: Codable {
    
    var title: String?
    var description: String?
    var image: String?

    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case image = "urlToImage" // 이미지는 변수명 변경
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
    
}
