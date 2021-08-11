//
//  SceneDelegate.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private func setRootViewController(_ viewController: UIViewController?) {
        guard let unwrappedWindow = window else { return }
        
        unwrappedWindow.rootViewController = viewController

        UIView.transition(
            with: unwrappedWindow,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: {},
            completion: nil
        )
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        let coordinator = Coordinator(setRootViewController)
        coordinator.start()
    }

}

