//
//  UserDefaults.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 31/7/23.
//

import Foundation

final class UserdefaultsService {
    
//    enum Keys: String {
//        case titleName
//    }
    
    static let shared = UserdefaultsService()
    
    private init() { }
    
    func save<T: Any>(_ item: T, forKey key: String) {
//        UserDefaults.standard.setValue(item, forKey: key.rawValue)
        UserDefaults.standard.setValue(item, forKey: key)
    }
    func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    func get<T: Any>(forKey key: String) -> T? {
       return UserDefaults.standard.object(forKey: key) as? T
    }
//    func get<T: Any>(forKey key: Keys) -> T? {
//        UserDefaults.standard.object(forKey: key.rawValue) as? T
//    }
}
