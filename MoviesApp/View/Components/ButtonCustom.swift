//
//  ButtonCustom.swift
//  MoviesApp
//
//  Created by rapalma on 24/2/23.
//

import SwiftUI


struct OscuroStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: Constants.StandarButtonsWidth, height: Constants.StandarButtonsHeight, alignment: .center)
            .background(.blue)
            .font(.system(size: Constants.FontSizeCustom))
            .cornerRadius(Constants.StandarCornerRadius)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            
    }
}
