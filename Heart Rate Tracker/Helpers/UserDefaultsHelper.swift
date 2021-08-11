//
//  UserDefaultsHelper.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 11/8/2021.
//

import Foundation

struct UserDefaultsHelper {
    
    enum Key: String {
        case username
        case password
    }
    
    var credentialsAreSet: Bool {
        guard let _ = UserDefaults.standard.string(forKey: Key.username.rawValue) else {
            return false
        }
        guard let _ = UserDefaults.standard.string(forKey: Key.password.rawValue) else {
            return false
        }
        
        return true
    }
    
    func set(_ username: String, and password: String) {
        UserDefaults.standard.setValue(username, forKey: Key.username.rawValue)
        UserDefaults.standard.setValue(password, forKey: Key.password.rawValue)
    }
    
    func removeCredentials() {
        UserDefaults.standard.setValue(nil, forKey: Key.username.rawValue)
        UserDefaults.standard.setValue(nil, forKey: Key.password.rawValue)
    }
    
}
