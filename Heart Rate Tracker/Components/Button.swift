//
//  Button.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class Button: UIButton {
    private let COLOR_ENABLED  = UIColor.white
    private let COLOR_DISABLED = UIColor.white.withAlphaComponent(0.6)
    
    override var isEnabled: Bool {
        didSet {
            applyEnabledStyling()
        }
        
    }
    
    init() {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        layer.borderWidth = 1
        layer.cornerRadius = frame.height / 2
        
        applyEnabledStyling()
    }
    
    private func applyEnabledStyling() {

        if isEnabled {
            layer.borderColor = COLOR_ENABLED.cgColor
            setTitleColor(COLOR_ENABLED, for: .normal)
        } else {
            layer.borderColor = COLOR_DISABLED.cgColor
            setTitleColor(COLOR_DISABLED, for: .normal)
        }
        
    }
    
}
