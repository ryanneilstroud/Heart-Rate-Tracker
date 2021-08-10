//
//  TakeHeartRateViewController.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class TakeHeartRateViewController: BaseViewController {

    var submit: ((Int) -> Void)?

    @IBAction func addRecord(_ sender: UIButton) {
        submit?(10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
