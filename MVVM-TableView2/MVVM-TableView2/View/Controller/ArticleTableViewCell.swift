//
//  ArticleTableViewCell.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var item: Article? {
        didSet {
            guard let article = item else { return }
            self.titleLabel.text = article.title
            self.descriptionLabel.text = article.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
