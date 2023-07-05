//
//  AppDelegate.swift
//  firebase-auth-poc
//
//  Created by Leo on 04/07/2023.
//

import Foundation
import UIKit
import Firebase

class AppDelegate : UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        return true
    }
}
