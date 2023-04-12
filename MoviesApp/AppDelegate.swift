//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by rapalma on 12/4/23.
//

import Foundation
import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class AppDelegate: NSObject, UIApplicationDelegate {
    
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here AppDelegate..........")
        AppCenter.start(withAppSecret: "67769886-26d7-4f65-86ed-a2770a019b26", services:[
          Analytics.self,
          Crashes.self
        ])
       
        return true
    }
    
  

    
}
