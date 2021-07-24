//
//  ViewController.swift
//  MVVM-TableView
//
//  Created by 권민하 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {
    private var articleListVM: ArticleListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initViewModel()
    }
    
    func initViewModel() {
        ArticleService.getArticles { (articles) in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
            }
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        else {fatalError("no matched articleTableViewCell identifier")}
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.descriptionLabel.text = articleVM.description
        cell.titleLabel?.text = articleVM.title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
}
