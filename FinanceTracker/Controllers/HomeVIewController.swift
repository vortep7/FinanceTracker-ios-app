//
//  HomeVIewController.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 11.03.2024.
//
import Firebase
import UIKit

class HomeVIewController: UIViewController {
    
    var homeView:HomeView {return self.view as! HomeView}

    override func viewDidLoad() {
        homeView.onActionForExitButton = {[weak self] in self?.exitAction()}
    }
    
    override func loadView() {
        self.view = HomeView(frame: UIScreen.main.bounds)
    }
}

extension HomeVIewController {
    @objc func exitAction() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
}
