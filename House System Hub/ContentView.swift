//
//  ContentView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 12/17/19.
//  Copyright © 2019 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Welcome to the House System Hub").font(.headline)
            Text("Please sign in with your Google Account to get started.").font(.subheadline).padding()
            google().frame(width: 200, height: 50, alignment: .center)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct google: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .dark
        button.style = .wide
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        //
    }
}
