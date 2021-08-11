//
//  APIClientProtocol.swift
//  APIClient-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation
import Alamofire

protocol APIClientProtocol : AnyObject {

    func performRequest<T: Decodable>(route: APIRouter, completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest
}
