//
//  SecondArticleListTableViewCell.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/12.
//

import UIKit
import Kingfisher

class SecondArticleListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var tableTitleLabel: UILabel!
    @IBOutlet weak var tableDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateCell(model: Any){
        if let object = model as? ArticleList {
            tableImageView.kf.setImage(with: URL(string: object.image ?? "0"), placeholder: #imageLiteral(resourceName: "defalutImage"))
            tableTitleLabel.text = object.title
            tableDescriptionLabel.text = object.description
        }
    }

}
