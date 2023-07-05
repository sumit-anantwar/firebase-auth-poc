//
//  ListenerScreen.swift
//  firebase-auth-poc
//
//  Created by Leo on 04/07/2023.
//

import SwiftUI

struct ListenerScreen: View {
    
    @StateObject var screenObject = ListenerScreenObject()
    
    var body: some View {
        VStack {
            TextField("Username", text: $screenObject.username)
                .multilineTextAlignment(.center)
                .disabled(screenObject.didLogin)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
                
            
            TextField("Password", text: $screenObject.password)
                .multilineTextAlignment(.center)
                .disabled(screenObject.didLogin)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            
            Button(action: {
                loginLogout()
            }, label: {
                Text(
                    buttonTitle
                )
            })
            .disabled(loginDisabled)
            .padding()
            .frame(width: 200)
            .background(loginBackground)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        }
    }
    
    private var buttonTitle: String {
        if self.screenObject.didLogin {
            return "Logout"
        } else {
            return "Login"
        }
    }
    
    private var loginDisabled: Bool {
        return self.screenObject.username.isEmpty ||
            self.screenObject.password.isEmpty
    }
    
    private var loginBackground: Color {
        if loginDisabled {
            return Color.gray
        }
        
        return Color.blue
    }
    
    private func loginLogout() {
        if screenObject.didLogin {
            screenObject.logout()
        } else {
            screenObject.login()
        }
    }
}

struct ListenerScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListenerScreen()
    }
}
