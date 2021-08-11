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
    var mockApiClient: MockAPIClient!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Initializing properties
        dataSource = GenericDataSource<ArticleList>()
        viewModel = ArticleListViewModel(apiClient: APIClient2(), dataSource: dataSource)
        vc = ArticleListTableViewController()
        mockApiClient = MockAPIClient()
    }
    
    override func tearDownWithError() throws {
        
        // Deinitializing propertise
        viewModel = nil
        vc = nil
        dataSource = nil
        mockApiClient = nil
        
        try super.tearDownWithError()
    }
    
    func testFetchArticleListWorking() {
        let expectation = XCTestExpectation(description: "Article List fetch")
        
        // giving a service mocking vehicles list
        mockApiClient.articleListModel =
            ArticleListModel(articleList: [ArticleList(title: "1",
                                                       description: "2",
                                                       image: "3")])
        
        
//        guard let data = FileManager.readJson(forResource: "Mock") else {
//            XCTAssert(false, "Can't get data from sample.json")
//            return
//        }
        
        viewModel.onError = { _ in
            XCTAssert(false, "Failed to fetch Article list")
        }
        
        dataSource.data.addObserver(self) { _ in
            print("1111")
            print(self.dataSource.data.value)
            expectation.fulfill()
        }
        
        mockApiClient.getArticles { result in
            switch result {
            case .success(let articles):
                self.dataSource?.data.value = articles.articleList ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        viewModel.fetchArticleList()
        wait(for: [expectation], timeout: 5.0)
    }
    
}

/// MOCK APIClient class for testing
/// Conforming APIClient protocol to call web service

class MockAPIClient: APIClientProtocol {
    
    var articleListModel : ArticleListModel?

    @discardableResult
    func performRequest<T>(route: APIRouter, completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest where T : Decodable {
        return AF.request(route)
            .responseDecodable { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
    
    func getArticles(completion: @escaping (Result<ArticleListModel, AFError>) -> Void) {
        performRequest(route: APIRouter.articles, completion: completion)
    }
}
