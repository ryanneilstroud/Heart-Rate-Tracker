//
//  Stepper.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class Stepper: UIStackView {
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        axis = .horizontal
        
        // left
        let leftView = makeStep()
        
        // center
        let label = UILabel()
        label.text = "200"
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = label.frame.height / 2
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        
        // right
        let rightView = makeStep()
        
        addArrangedSubview(leftView)
        addArrangedSubview(label)
        addArrangedSubview(rightView)
    }
    
    private func makeStep() -> UIStackView {
        
        // Initialize parent
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        
        // Initialize children
        let topSpacer = UIView()
        let button = Button()
        let bottomSpacer = UIView()
        
        // Add arranged subviews
        view.addArrangedSubview(topSpacer)
        view.addArrangedSubview(button)
        view.addArrangedSubview(bottomSpacer)
        
//        // Set constraints
//        topSpacer.heightAnchor.constraint(
//            equalTo: bottomSpacer.heightAnchor,
//            multiplier: 1
//        ).isActive = true
        button.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
//        button.widthAnchor.constraint(
//            equalTo: button.heightAnchor,
//            multiplier: 1
//        ).isActive = true
        
        return view
    }
}

