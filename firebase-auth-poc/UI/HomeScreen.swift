//
//  ContentView.swift
//  firebase-auth-poc
//
//  Created by Leo on 03/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    enum DestinationType {
        case presenter, listener
    }
    
    @State private var destinationType: DestinationType?
    
    var body: some View {
        VStack {
            NavigationLink(destination: PresenterScreen(), tag: .presenter, selection: $destinationType, label: {EmptyView()})
            NavigationLink(destination: ListenerScreen(), tag: .listener, selection: $destinationType, label: {EmptyView()})
            
            Button(action: {
                destinationType = .presenter
            }, label: {
                Text("Presenter")
            })
            .padding()
            .frame(width: 200)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
            
            Button(action: {
                destinationType = .listener
            }, label: {
                Text("Listener")
            })
            .padding()
            .frame(width: 200)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        }
        .padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
