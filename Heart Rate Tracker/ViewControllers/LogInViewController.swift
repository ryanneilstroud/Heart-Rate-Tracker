//
//  LogInViewController.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class LogInViewController: BaseViewController {
    typealias SubmitCredentials = (String, String) -> Void
    
    @IBOutlet weak var username: TextField!
    @IBOutlet weak var password: TextField!
    @IBOutlet weak var submitButton: Button!
    
    var submit: SubmitCredentials?
    var error: ((AppError) -> Void)?
    
    private var textFieldsAreValid: Bool {
        guard let u = username.text?.trimmingCharacters(in: .whitespaces) else { return false }
        guard let p = password.text?.trimmingCharacters(in: .whitespaces) else { return false }
        
        if u.isEmpty || p.isEmpty { return false }
        
        return true
    }
    
    @IBAction func login() {
        if textFieldsAreValid {
            submit?(username.text!, password.text!)
        } else {
            error?(.emptyAuth)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.delegate = self
        password.delegate = self
        
        username.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
}

extension LogInViewController: UITextFieldDelegate {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        submitButton.isEnabled = textFieldsAreValid
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case username: password.becomeFirstResponder()
        case password: login()
        default:       break
        }
        
        return true
    }
}

