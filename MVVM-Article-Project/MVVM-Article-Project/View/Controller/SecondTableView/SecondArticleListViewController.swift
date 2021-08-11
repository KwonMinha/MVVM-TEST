//
//  SecondArticleListViewController.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/12.
//

import UIKit

class SecondArticleListViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    lazy var viewModel: SecondArticleListViewModel = {
        let viewModel = SecondArticleListViewModel(apiClient: SecondArticleService())
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        viewModel.articlList.bind { (_) in
            self.showTableView()
        }
        
        self.viewModel.fetchArticleList()
    }
    
    func showTableView() {
        DispatchQueue.main.async {
            if self.viewModel.articlList.value.isEmpty {
                self.showEmptyView()
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    func showEmptyView() {
        //        self.tableView.isHidden = true
        //        self.emptyView.isHidden = false
        //        self.activityIndicator.isHidden = true
    }
}

extension SecondArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SecondArticleListTableViewCell = tableView.dequeueTableCell(for: indexPath)
        
        cell.updateCell(model: self.viewModel.articlList.value[indexPath.row])
   
        return cell
    }
    
    
}
