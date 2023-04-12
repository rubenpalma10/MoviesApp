//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by rapalma on 24/2/23.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            LoginView()
        }
    }
}
