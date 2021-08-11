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
        
        guard let snapshot = window?.snapshotView(afterScreenUpdates: true) else {
            return
        }
        viewController?.view.addSubview(snapshot)

        window?.rootViewController = viewController

        UIView.animate(withDuration: 0.3, animations: {
           snapshot.layer.opacity = 0
           snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
           }, completion: {
             (value: Bool) in
             snapshot.removeFromSuperview()
         })

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        let coordinator = Coordinator(setRootViewController)
        coordinator.start()
    }

}

