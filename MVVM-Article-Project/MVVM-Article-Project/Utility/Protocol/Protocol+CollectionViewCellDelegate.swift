//
//  Protocol+CollectionViewCellDelegate.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation

protocol CollectionViewCellDelegate: AnyObject {
    func selectedCollectionViewCell(_ index: Int)
}
