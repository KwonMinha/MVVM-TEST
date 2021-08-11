//
//  Protocol+ResuableCell.swift
//  MVVM-Article-Project
//
//  Created by 권민하 on 2021/08/08.
//

import Foundation

protocol ReusableCell: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String { return String(describing: self) }
}
