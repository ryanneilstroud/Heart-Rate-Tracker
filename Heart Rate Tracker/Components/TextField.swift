//
//  TextField.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class TextField: UITextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
    }
}
