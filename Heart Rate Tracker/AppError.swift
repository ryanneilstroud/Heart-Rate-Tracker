//
//  AppError.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import Foundation

enum AppError {
    case emptyAuth
    
    var description: String {
        switch self {
        case .emptyAuth:
            return "Those can't be empty!"
        }
    }
}
