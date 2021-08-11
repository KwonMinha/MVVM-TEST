//
//  GenericDataSource.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: Dynamic<[T]> = Dynamic([])
}
