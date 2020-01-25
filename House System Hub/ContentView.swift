//
//  ContentView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 12/17/19.
//  Copyright © 2019 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI
import GoogleSignIn
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
//                Text("Hello user!")
//                Button("Logout") {
//                    self.session.signOut()
//                }
                MainView()
            } else {
              SignInView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
