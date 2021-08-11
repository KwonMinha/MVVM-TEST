//
//  Dynamic.swift
//  APIClient-Project
//
//  Created by 권민하 on 2021/08/12.
//

import Foundation

// MARK: - Class
/// Class to make generic datasource with change data listner and notifies UI updates

class Dynamic<T> {
    
    // MARK: - Properties
    
    typealias CompletionHandler = ((T) -> Void)
    private var observers = [String: CompletionHandler]()
    

    // MARK: - Initializer
    /// - parameter value: generic datasource object
    
    init(_ value: T) {
        self.value = value
    }
    
    
    // MARK: - Datasource element

    var value : T {
        didSet {
            self.notify()
        }
    }
    
    /// Method to add observer on datasource to update its dat
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    /// Add and notify observer method update data and notify the listner
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    /// Method to notify datasource listner to update UI or perform required action
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    // MARK: - De-Initializer
    
    deinit {
        observers.removeAll()
    }
}
