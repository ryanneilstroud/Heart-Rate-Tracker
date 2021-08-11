//
//  TakeHeartRateViewController.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class TakeHeartRateViewController: BaseViewController {

    @IBOutlet private weak var valueLabel: UILabel!
    var submit: ((Int) -> Void)?

    @IBAction private func sliderChanged(_ sender: UISlider) {
        
        valueLabel.text = "\(Int(sender.value))"
        
    }
    @IBAction private func addRecord(_ sender: UIButton) {
        submit?(Int(valueLabel.text ?? "-1") ?? -1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
