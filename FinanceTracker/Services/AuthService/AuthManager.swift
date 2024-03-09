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
    
    func createUser(_ email:String,_ password: String) {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password)
        } else {
            print("error")
        }
    }
    
    func checkUser(_ email:String,_ password: String) {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: email, password: password)
        } else {
            print("error")
        }
    }
}
