//
//  firebase_auth_pocApp.swift
//  firebase-auth-poc
//
//  Created by Leo on 03/07/2023.
//

import SwiftUI

@main
struct FirebaseAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
