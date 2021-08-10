//
//  FloatingButton.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class FloatingButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.cornerRadius = frame.height / 2
        layer.shadowColor  = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
    }
    
}
