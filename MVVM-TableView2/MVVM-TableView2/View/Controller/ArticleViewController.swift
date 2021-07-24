//
//  ArticleViewController.swift
//  MVVM-TableView2
//
//  Created by 권민하 on 2021/07/22.
//

import UIKit

class ArticleViewController: UIViewController {
    
    lazy var viewModel: ArticleViewModel = {
        let viewModel = ArticleViewModel()
        return viewModel
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        viewModel.articles.bind { (_) in
            self.showTableView()
        }
        
        self.viewModel.fetchArticles()
    }
    
    func showTableView() {
        DispatchQueue.main.async {
            if self.viewModel.articles.value.isEmpty {
                self.showEmptyView()
            } else {
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
    }
    
    func showEmptyView() {
        //        self.tableView.isHidden = true
        //        self.emptyView.isHidden = false
        //        self.activityIndicator.isHidden = true
    }
    
    
}

extension ArticleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.item = self.viewModel.articles.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ArticleViewController: UITableViewDelegate {
    
}
