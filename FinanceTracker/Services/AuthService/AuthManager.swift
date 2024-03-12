//
//  AuthManager.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 08.03.2024.
//

import Foundation
import Firebase

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    var state: Bool = true {
        didSet {
            stateDidChange?(state)
        }
    }
    
    var userUID: String?
    
    var stateDidChange: ((Bool) -> Void)?
    
    func createUser(_ email:String,_ password: String) {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("error")
                    self.state = false
                } else {
                    self.state = true
                }
            }
        } else {
            self.state = false
        }
    }
    
    func checkUser(_ email:String, _ password: String) {
        if !email.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("error")
                    self.state = false
                } else {
                    self.state = true
                }
            }
        } else {
            self.state = false
        }
    }

}
