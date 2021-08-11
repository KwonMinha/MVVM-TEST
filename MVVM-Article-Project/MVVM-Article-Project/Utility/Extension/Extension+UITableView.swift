//
//  Extension+UITableView.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueTableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell: T = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(Date()): Generic UITableViewCell is Error")
        }
        
        return cell
    }
}

extension UITableViewCell: ReusableCell {}
