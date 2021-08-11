//
//  FileDataService.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/11.
//

import Foundation
import Alamofire

final class FileDataService : APIClientProtocol {
    
    static let shared = FileDataService()
    
    func performRequest<T>(route: APIRouter, completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest where T : Decodable {
        return AF.request(route)
                        .responseDecodable { (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
}
    
    /*
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void)) {
        
        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "sample") else {
            completion(Result.failure(ErrorResult.custom(string: "No file or data")))
            return
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    */

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: FileDataService.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
}
