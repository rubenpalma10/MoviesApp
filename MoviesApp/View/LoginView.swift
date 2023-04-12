//
//  LoginView.swift
//  MoviesApp
//
//  Created by rapalma on 24/2/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
            VStack {
               // Campo de texto para el nombre de usuario
               TextField("Nombre de usuario", text: $loginViewModel.userModel.usuario)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               // Campo de texto para la contraseña
               SecureField("Contraseña", text: $loginViewModel.userModel.password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               // Botón de inicio de sesión
               Button(action: {
                   loginViewModel.iniciarSesion()
               }) {
                   Text("Iniciar sesión")
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(10)
               }
               .padding()
            }
            .padding()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
