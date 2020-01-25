//
//  MainView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/14/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
        print("Listening...")
    }
    
    var body: some View {
        Group {
        if (session.session != nil) {
            TabView {
                ReportView()
                    .tabItem {
                        VStack {
                            Image(systemName: "book.circle.fill")
                            Text("Reports")
                        }
                }.tag(0)
                
                ArchiveView()
                    .tabItem {
                        VStack {
                            Image(systemName: "archivebox.fill")
                            Text("Archive")
                        }
                }.tag(1)
                
                Text("3")
                    .tabItem {
                        VStack {
                            Image(systemName: "info.circle.fill")
                            Text("Logs")
                        }
                }.tag(2)
                
                Text("4")
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.bar.fill")
                            Text("Standings")
                        }
                }.tag(3)
                
                Text("5")
                    .tabItem {
                        VStack {
                            Image(systemName: "barcode")
                            Text("Events")
                        }
                }.tag(4)
                
                Text("6")
                    .tabItem {
                        VStack {
                            Image(systemName: "wrench.fill")
                            Text("Settings")
                        }
                }.tag(4)
            }
        } else {
            SignInView().colorScheme(.light)
        }
        
        }.onAppear(perform: getUser)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
