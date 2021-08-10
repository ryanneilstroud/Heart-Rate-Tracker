//
//  Coordinator.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class Coordinator {
    typealias SetRootViewController = (UIViewController?) -> Void

    private var storyboard = UIStoryboard(name: "Main", bundle: nil)
    private var setRootViewController: SetRootViewController
    
    init(_ setRootViewController: @escaping SetRootViewController) {
        self.setRootViewController = setRootViewController
    }
    
    func start() {
        var isLoggedIn = true
        var hasHeartRates = true
        
        if !isLoggedIn {
            setRootViewController(logIn)
        } else if hasHeartRates {
            setRootViewController(heartRates)
        } else {
            setRootViewController(newHeartRate)
        }
    }
    
    private var logIn: UIViewController? {
        let vc = viewController(to: LogInViewController.self)
        vc?.submit = { username, password in
            self.setRootViewController(self.newHeartRate)
        }
        vc?.error = {
            vc?.present(self.makeAlert(with: $0), animated: true)
        }
        return vc
    }
    
    private var heartRates: UIViewController? {
        let navC = viewController(to: HeartRatesNavigationController.self)
        let vc   = viewController(to: HeartRatesViewController.self)
        vc?.takeHeartRate = {
            self.setRootViewController(self.newHeartRate)
        }
        vc?.logout = {
            self.setRootViewController(self.logIn)
        }
        navC?.viewControllers = [vc!]

        return navC
    }
    
    private var newHeartRate: UIViewController? {
        let vc = viewController(to: TakeHeartRateViewController.self)
        vc?.submit = { rate in
            print(rate)
            self.setRootViewController(self.heartRates)
        }
        return vc
    }
    
    private func makeAlert(with error: AppError) -> UIAlertController {
        let a = UIAlertController(title: error.description, message: nil, preferredStyle: .alert)
        a.addAction(
            UIAlertAction(title: "OK", style: .cancel)
        )
        return a
    }
    
    private func viewController<T>(to type: T.Type) -> T? {
        return storyboard.instantiateViewController(identifier: String(describing: type.self)) as? T
    }
}
