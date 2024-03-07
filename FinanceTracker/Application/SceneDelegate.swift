//
//  SceneDelegate.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 06.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //MARK: - scene manager
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let controller = MenuViewController()
        let navigationViewController = UINavigationController(rootViewController: controller)
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }

    //MARK: - save in core data
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

