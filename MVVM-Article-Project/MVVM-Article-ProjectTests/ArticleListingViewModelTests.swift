//
//  ArticleListingViewModelTests.swift
//  MVVM-Article-ProjectTests
//
//  Created by 권민하 on 2021/08/09.
//

import Alamofire
import XCTest
@testable import MVVM_Article_Project

class ArticleListingViewModelTests: XCTestCase {
    
    // MARK: -  Propertise
    
    var viewModel: ArticleListViewModel!
    var vc: ArticleListTableViewController!
    var dataSource: GenericDataSource<ArticleList>!
    var service: MockArticleService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Initializing properties
        self.dataSource = GenericDataSource<ArticleList>()
        self.service = MockArticleService()
        self.viewModel = ArticleListViewModel(service: service, dataSource: dataSource)
        self.vc = ArticleListTableViewController()
    }
    
    override func tearDownWithError() throws {
        
        // Deinitializing propertise
        self.viewModel = nil
        self.service = nil
        self.vc = nil
        self.dataSource = nil
        
        try super.tearDownWithError()
    }
    
    func testFetchWithNoService() {
        let expectation = XCTestExpectation(description: "No service Article List")
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch ''
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchArticleList()

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchArticleListWorking() {
        let expectation = XCTestExpectation(description: "Article List fetch")
 
        // giving a service mocking
        service.articles = ArticleListModel(articleList: [ArticleList(title: "kwon", description: "minha", image: "")])
        
//        guard let data = FileManager.readJson(forResource: "Mock") else {
//            XCTAssert(false, "Can't get data from sample.json")
//            return
//        }
        
        viewModel.onErrorHandling = { _ in
            XCTAssert(false, "ViewModel should not be able to fetch without service")
        }
        
        dataSource.data.addObserver(self) { _ in
            print("-------------------------------------------")
            print(self.dataSource.data.value)
            
            expectation.fulfill()
        }
        
        viewModel.fetchArticleList()
     
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchNoCurrencies() {
        let expectation = XCTestExpectation(description: "No Article List")
        
        // giving a service mocking error during fetching currencies
        service.articles = nil
        
        // expected completion to fail
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchArticleList()

        wait(for: [expectation], timeout: 5.0)
    }

}

class MockArticleService: ArticleServiceProtocol {
    
    var articles: ArticleListModel?
    
    func getArticleList(completion: @escaping ((NetworkResult<Any>) -> Void)) {
        if let articles = articles {
            completion(NetworkResult.success(articles.articleList ?? []))
        }
    }
    
}
