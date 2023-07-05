//
//  PresenterScreen.swift
//  firebase-auth-poc
//
//  Created by Leo on 04/07/2023.
//

import SwiftUI

struct PresenterScreen: View {
    
    @StateObject var screenObject = PresenterScreenObject()
    
    var body: some View {
        VStack {
            Button(action: {
                registerUnRegister()
            }, label: {
                Text(
                    buttonTitle()
                )
            })
            .padding()
            .frame(width: 200)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        }
    }
    
    private func buttonTitle() -> String {
        if self.screenObject.didRegister {
            return "Unregister"
        } else {
            return "Register"
        }
    }
    
    private func registerUnRegister() {
        if self.screenObject.didRegister {
            self.screenObject.unRegister()
        } else {
            self.screenObject.register()
        }
    }
}

struct PresenterScreen_Previews: PreviewProvider {
    static var previews: some View {
        PresenterScreen()
    }
}
