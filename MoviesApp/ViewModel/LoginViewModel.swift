//
//  LoginViewModel.swift
//  MoviesApp
//
//  Created by rapalma on 24/2/23.
//

import Foundation
import AppCenterCrashes

class LoginViewModel:ObservableObject{
    @Published var loader:Bool = false
    @Published var userModel:UserModel = UserModel()
    
    
    
    func iniciarSesion() {
        print("datos .......")
        print(userModel.usuario)
        print(userModel.password)
        Crashes.generateTestCrash()
    }
}
