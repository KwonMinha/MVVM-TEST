//
//  ArticleViewController.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//

import UIKit

class ArticleViewController: UIViewController {
    
    private var viewModel: ArticleListViewModel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewModel()
    }
    
    func initViewModel() {
        ArticleService.getArticles { (articles) in
            if let articles = articles {
                self.viewModel = ArticleListViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }


}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found") }
        
        let articleList = self.viewModel.articles.value[indexPath.row]
        cell.textLabel?.text = articleList.title
        cell.descriptionTextView?.text = articleList.description
        return cell
    }


}
