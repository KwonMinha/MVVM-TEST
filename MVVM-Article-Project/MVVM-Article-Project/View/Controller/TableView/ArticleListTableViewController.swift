//
//  ArticleListTableViewController.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import UIKit

class ArticleListTableViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var dataSource = ArticleListDatasource()
    private var viewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //viewModel = ArticleListViewModel(dataSource: dataSource)
        viewModel = ArticleListViewModel(apiClient: APIClient2(), dataSource: dataSource)
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        tableView.dataSource = dataSource
        
        dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchArticleList()
    }

}

class ArticleListDatasource: GenericDataSource<ArticleList>, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleListTableViewCell = tableView.dequeueTableCell(for: indexPath)
   
        cell.updateCell(model: data.value[indexPath.row])
        
        return cell
    }
}
