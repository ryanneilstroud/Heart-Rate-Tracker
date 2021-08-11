//
//  Coordinator.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit
import CoreData

class Coordinator {
    typealias SetRootViewController = (UIViewController?) -> Void

    private let modelHelper = ModelHelper()
    private let userDefaultsHelper = UserDefaultsHelper()
    
    private var storyboard = UIStoryboard(name: "Main", bundle: nil)
    private var setRootViewController: SetRootViewController
    
    init(_ setRootViewController: @escaping SetRootViewController) {
        self.setRootViewController = setRootViewController
    }
    
    func start(shouldTakeHeartRate: Bool = false) {
                
        if shouldTakeHeartRate {
            setRootViewController(newHeartRate)
        } else if !userDefaultsHelper.credentialsAreSet {
            setRootViewController(logIn)
        } else if !modelHelper.heartratesIsEmpty {
            let data = modelHelper.getHeartrates()
            let vc   = getHeartrates(data.heartrates.reversed())
            setRootViewController(vc)
            
            if let error = data.error {
                let alert = makeAlert(with: error)
                vc?.present(alert, animated: true)
            }
        }
    }
    
    private var logIn: UIViewController? {
        let vc = viewController(to: LogInViewController.self)
        vc?.submit = { username, password in
            self.userDefaultsHelper.set(username, and: password)
            self.start()
        }
        vc?.error = {
            vc?.present(self.makeAlert(with: $0), animated: true)
        }
        return vc
    }
    
    private func getHeartrates(_ data: [Heartrate] = []) -> UIViewController? {
        let navC = viewController(to: HeartRatesNavigationController.self)
        let vc   = viewController(to: HeartRatesViewController.self)
        vc?.heartrates = data
        vc?.takeHeartRate = {
            self.start(shouldTakeHeartRate: true)
        }
        vc?.logout = {
            self.userDefaultsHelper.removeCredentials()
            self.start()
        }
        navC?.viewControllers = [vc!]

        return navC
    }
    
    private var newHeartRate: UIViewController? {
        let vc = viewController(to: TakeHeartRateViewController.self)
        vc?.submit = { rate in
            if let error = self.modelHelper.postHeartrate(rate) {
                let alert = self.makeAlert(with: error)
                vc?.present(alert, animated: true)
            } else {
                self.start()
            }
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
