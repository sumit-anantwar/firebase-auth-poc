//
//  PresenterScreenObject.swift
//  firebase-auth-poc
//
//  Created by Leo on 04/07/2023.
//

import Foundation
import Firebase
import Combine

final class PresenterScreenObject : ObservableObject {
    
    @Published var didRegister: Bool = false
    
    private var presenter: User!
    private var listener: User!
    
    private var processing = false
    
    func register() {
        if self.processing { return }
        self.processing = true
        
        Task {
            do {
                let presenterEmail = "\(getRandomString(5))-presenter@voxtours.com"
                let presenterPassword = getRandomString(includeSpecialCharacters: true)
                let presenterResult = try await registerUser(email: presenterEmail, passwoed: presenterPassword)
                self.presenter = presenterResult.user
                
                let listenerEmail = "\(getRandomString(5))-listener@voxtours.com"
                let listenerPassword = getRandomString(includeSpecialCharacters: true)
                let listenerResult = try await registerUser(email: listenerEmail, passwoed: listenerPassword)
                self.listener = listenerResult.user
                
                DispatchQueue.main.async {
                    self.didRegister = true
                }
            } catch {
                print(error.localizedDescription)
            }
            
            self.processing = false
        }
    }
    
    func unRegister() {
        if self.processing { return }
        self.processing = true
        
        Task {
            do {
                try await self.deleteUser(presenter)
                try await self.deleteUser(listener)
                
                DispatchQueue.main.async {
                    self.didRegister = false
                }
            } catch {
                print(error.localizedDescription)
            }
            
            self.processing = false
        }
    }
    
    private func deleteUser(_ user: User?) async throws {
        if let user = user {
            print("Unregistering user with email: \(user.email ?? "---")")
            try await user.delete()
        }
    }
    
    private func registerUser(email: String, passwoed: String) async throws -> AuthDataResult {
        print("Registering user with Email: \(email) --- password: \(passwoed)")
        return try await Auth.auth().createUser(withEmail: email, password: passwoed)
    }
    
    private func getRandomString(_ length: Int = 8, includeSpecialCharacters: Bool = false) -> String {
        var pool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        if includeSpecialCharacters {
            pool += "!@#$%^&*"
        }
        
        let collection = (0 ..< length).compactMap { _ in
            String(pool.randomElement()! as Character)
        }
        return collection.joined()
    }
}
