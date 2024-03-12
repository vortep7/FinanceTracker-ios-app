//
//  RegistrViewController.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 08.03.2024.
//

import UIKit
import Firebase

class RegistrViewController: UIViewController {
    var regView: RegView { return self.view as! RegView}
    
    
    var signup : Bool = true {
        willSet {
            if newValue {
                regView.changeText(!signup)
                regView.changeTextForButton(!signup)
            } else {
                regView.changeText(!signup)
                regView.changeTextForButton(!signup)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        regView.onFirstActionForBotton = {[weak self] in self?.firstButtonAction()}
        regView.onSecondActionForBotton = {[weak self] in self?.secondButtonAction()}
        
        AuthManager.shared.stateDidChange = { [weak self] state in
                   if !state {
                       self!.addd()
                   }
               }
    }
    
    override func loadView() {
        self.view = RegView(frame: UIScreen.main.bounds)
    }
    
    private func addd() {
        present(regView.alert, animated: true)
    }

}

extension RegistrViewController {
    @objc func firstButtonAction() {
        signup = !signup
    }
    
    @objc func secondButtonAction() {
        let email = regView.firstTextField.text!
        let password = regView.secondTextField.text!
        
        if (signup) {
            AuthManager.shared.createUser(email, password)
        } else {
            AuthManager.shared.checkUser(email, password)
        }
    }
    
}
