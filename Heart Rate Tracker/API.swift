//
//  API.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import Foundation

class API {
    static let BASE_URL = ""
    
    enum Path {
        case getHeartrates
        case postHeartrates
        
        var value: String {
            switch self {
            case .getHeartrates:
                return "/customer/{}/genetic"
            case .postHeartrates:
                return "/customer/{}/heartrate"
            }
        }
    }
    
    func login() {}
    func logout() {}
    
    func getHeartrates() {
        let path = API.BASE_URL + Path.getHeartrates.value
    }
    
    func postHeartrate() {
        
    }
    
}
