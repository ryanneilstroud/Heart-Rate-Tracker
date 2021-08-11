//
//  UserDefaultsHelper.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 11/8/2021.
//

import Foundation

struct UserDefaultsHelper {
    
    enum Key: StringLiteral {
        case username
        case password
    }
    
    func set(_ username: String, and password: String) {
        UserDefaults.standard.set(userame, forKey: Key.username.literal)
        UserDefaults.standard.set(password, forKey: Key.password.literal)
    }
    
}
