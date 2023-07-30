//
//  UserDefaults.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 31/7/23.
//

import Foundation

final class UserdefaultsService {
    
    enum Keys: String {
        case titleName
    }
    
    static let shared = UserdefaultsService()
    
    private init() { }
    
    func save<T: Any>(_ item: T, forKey key: Keys) {
        UserDefaults.standard.setValue(item, forKey: key.rawValue)
    }
    func remove(forKey key: Keys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    func getString(forKey key: Keys) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
//    func get<T: Any>(forKey key: Keys) -> T? {
//        UserDefaults.standard.object(forKey: key.rawValue) as? T
//    }
}
