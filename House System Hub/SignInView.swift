//
//  SignInView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/13/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Login").bold().font(.title)
            Text("House System Hub")
                .font(.subheadline)
                //.padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
//            TextField("email address", text: $email)
//                .padding()
//                .frame(width: 400)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .cornerRadius(4.0)
//                .keyboardType(.emailAddress)
//
//            SecureField("Password", text: $password)
//                .padding()
//                .frame(width: 400)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .cornerRadius(4.0)
            
            google().frame(width: 120, height:50, alignment: .center).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
            
            
//            if (error) {
//                Text("ahhh crap")
//            }
//            Button(action: signIn) {
//                Text("Sign in")
//            }
        }
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
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
