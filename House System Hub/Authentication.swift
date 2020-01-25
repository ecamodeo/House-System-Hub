//
//  Authentication.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/13/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase
import Combine
import GoogleSignIn

class SessionStore : ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    var isLoggedIn = false { didSet { self.didChange.send(self) }}
    
    init(session: User? = nil) {
        self.session = session
    }
    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user.email)")
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                
                //self.session = User2(uid: user.uid, username: "", fullName: user.displayName, email: user.email, firstName: "", lastName: "", role: "mentor", house: "house", mentorGroup: "mg")
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }

    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        print("USER: \(session?.email)")
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
