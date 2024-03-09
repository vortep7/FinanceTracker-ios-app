//
//  SceneDelegate.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 06.03.2024.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //MARK: - scene manager
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.showAuth()
            } else {
                self.showMenu()
            }
        }
    }
    
    func showAuth() {
        let controller = RegistrViewController()
        let navigationViewController = UINavigationController(rootViewController: controller)
        
        let previousViewController = window?.rootViewController
        
        navigationViewController.view.alpha = 0.0
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        UIView.animate(withDuration: 1.0, animations: {
            previousViewController?.view.alpha = 0.0
            navigationViewController.view.alpha = 1.0
        }) { _ in
            previousViewController?.view.removeFromSuperview()
        }
    }

    func showMenu() {
        let controller = MenuViewController()
        let navigationViewController = UINavigationController(rootViewController: controller)
        
        let previousViewController = window?.rootViewController
        
        navigationViewController.view.alpha = 0.0
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        UIView.animate(withDuration: 1.0, animations: {
            previousViewController?.view.alpha = 0.0
            navigationViewController.view.alpha = 1.0
        }) { _ in
            previousViewController?.view.removeFromSuperview()
        }
    }
    
    //MARK: - save in core data
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

