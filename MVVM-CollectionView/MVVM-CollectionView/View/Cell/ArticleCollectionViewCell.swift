//
//  ArticleCollectionViewCell.swift
//  MVVM-CollectionView
//
//  Created by 권민하 on 2021/07/24.
//

import UIKit
import Kingfisher

class ArticleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ArticleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: Article? {
        didSet {
            guard let article = item else { return }
            self.titleLabel.text = article.title
            self.descriptionLabel.text = article.description
        }
    }
}
