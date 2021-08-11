//
//  AppError.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import Foundation

enum AppError {
    case emptyAuth
    case contextSaveFail
    case contextFetchFail
    
    var description: String {
        switch self {
        case .emptyAuth:
            return "Those can't be empty!"
        case .contextSaveFail:
            return "🤦‍♂️ we were unable to save your heart rate"
        case .contextFetchFail:
            return "We were unable to retrieve your heart rates 😭"
        }
    }
}
