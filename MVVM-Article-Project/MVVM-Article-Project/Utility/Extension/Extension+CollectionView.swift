//
//  Extension+CollectionView.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import UIKit

extension UICollectionView {
    
    // CollectionViewCell
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    // CollectionViewCell
    func dequeueCollectionCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell: T = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else { fatalError("\(Date()): Generic UICollectionViewCell is Error") }
        
        return cell
    }
}

extension UICollectionViewCell: ReusableCell {}
