//
//  ListenerScreenObject.swift
//  firebase-auth-poc
//
//  Created by Leo on 05/07/2023.
//

import Foundation
import Firebase

final class ListenerScreenObject : ObservableObject {
    
    @Published var didLogin: Bool = false
    @Published var username: String = ""
    @Published var password: String = ""
    
    private var isProcessing = false
    
    func login() {
        if self.isProcessing { return }
        self.isProcessing = true
        
        if username.isEmpty && password.isEmpty {
            return
        }
        Task {
            do {
                print("Login with email: \(username) and password: \(password)")
                try await Auth.auth().signIn(withEmail:username, password:password)
                
                DispatchQueue.main.async {
                    self.didLogin = true
                }
            } catch {
                print("Failed to login")
            }
            
            self.isProcessing = false
        }
    }
    
    func logout() {
        do {
            print("Logout")
            try Auth.auth().signOut()
            self.didLogin = false
        } catch {
            print("Failed to logout")
        }
    }
}
