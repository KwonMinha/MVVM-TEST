//
//  ArticleCollectionViewController.swift
//  MVVM-CollectionView
//
//  Created by 권민하 on 2021/07/24.
//

import UIKit

class ArticleCollectionViewController: UIViewController {
    
    lazy var viewModel: ArticleViewModel = {
        let viewModel = ArticleViewModel()
        return viewModel
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }
    
    func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        viewModel.articles.bind { (_) in
            self.showCollectionView()
        }
        
        self.viewModel.fetchArticles()
    }
    
    func showCollectionView() {
        DispatchQueue.main.async {
            if self.viewModel.articles.value.isEmpty { return }
            else {
                self.collectionView.reloadData()
            }
        }
    }
    
    
}

extension ArticleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        cell.item = self.viewModel.articles.value[indexPath.row]
        return cell
    }
    
    
}
