//
//  APIClientProtocol.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/09.
//

import Foundation
import Alamofire

protocol APIClientProtocol : AnyObject {

    func performRequest<T: Decodable>(route: APIRouter, completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest
}
