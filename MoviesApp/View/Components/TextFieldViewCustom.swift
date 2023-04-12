//
//  TextFieldViewCustom.swift
//  MoviesApp
//
//  Created by rapalma on 24/2/23.
//

import SwiftUI

enum TextFieldType{
    case normal
    case securefield
    case textarea
}

struct TextFieldViewCustom: View {
    var placeholder = ""
    var type = TextFieldType.normal
    @Binding var valor:String
    @State private var showPassword: Bool = false
    var typeKeyBoardParam:UIKeyboardType = .default
    var foregroundColorParam:Color = .gray
    var submitLabelParam:SubmitLabel = .return
    var textInputAutocapitalizationParam:TextInputAutocapitalization = .words
    var colorLineaBorder:Color = .gray
    var showIconBusqueda:Bool = false
    var iconSystemName:String = ""
    var showIconRight:Bool = false
    var disable:Bool = false
    
    var idControl:String?
    //var delegate:CustomInputFormDelegate?

    enum FocusField: Hashable {
       case field
     }

     @FocusState private var focusedField: FocusField?

    var rows:Double = 3
    var body: some View {
        switch(type){
        case .securefield:
            ZStack(alignment: .leading) {
                //PlaceHolder
                if(valor.isEmpty) {
                    Text(placeholder)
                    .foregroundColor(Color(.systemGray2))
                    .font(.system(size:Constants.FontSizeCustom))
                }
                HStack{
                    if(self.showPassword){
                        TextField("", text:  $valor)
                            .font(.system(size:Constants.FontSizeCustom))
                            .foregroundColor(.black)
                            .frame(height: Constants.AlturaStandarTexfield)

                    }else{
                        SecureField("", text: $valor)
                            .font(.system(size:Constants.FontSizeCustom))
                            .submitLabel(submitLabelParam)
                            .frame(height: Constants.AlturaStandarTexfield)

                    }

                    Button(action: {
                        withAnimation{
                            self.showPassword.toggle()
                        }
                    }) {
                        if(self.showPassword){
                            Image(systemName: "eye.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }else{
                            Image(systemName: "eye")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                    .accentColor(foregroundColorParam.opacity(0.8))
                }
            }
            .padding(EdgeInsets(top: Constants.StandarMarginBetweenForm,
                                leading: Constants.StandarMarginSidesForm,
                                bottom: Constants.StandarMarginBetweenForm,
                                trailing: Constants.StandarMarginSidesForm)
            )
            .overlay(
                // Add the outline
                RoundedRectangle(cornerRadius: Constants.StandarCornerRadiusForm)
                    .stroke(colorLineaBorder, lineWidth:Constants.StandarWidthStrokeTextfieldForm)
            )
            .background(Color.white)
         
        
        default:
            // First TextField
            ZStack(alignment: .leading) {
                //PlaceHolder
                if(valor.isEmpty) {
                    HStack{
                        if(showIconBusqueda){
                            Image(systemName: iconSystemName).foregroundColor(.gray)
                        }
                        Text(placeholder)
                        .foregroundColor(Color(.systemGray2))
                        .font(.system(size:Constants.FontSizeCustom))
                        if(showIconRight){
                            Image(systemName: iconSystemName).foregroundColor(.gray)
                        }
                    }
                }
                HStack{
                    if(showIconBusqueda){
                        Image(systemName: iconSystemName).foregroundColor(.gray)
                    }

                    if(type == .textarea){
                        TextEditor(text: $valor)
                            .foregroundColor(.black)
                        .submitLabel(submitLabelParam)
                        .font(.system(size:Constants.FontSizeCustom))
                        .frame(height: Constants.AlturaStandarTexfield * rows)
                        .keyboardType(typeKeyBoardParam)
                        .textInputAutocapitalization(textInputAutocapitalizationParam)
                        .disabled(disable)
                        .multilineTextAlignment(.leading)
                    }else{
                        TextField("", text: $valor)
                            .foregroundColor(.black)
                        .submitLabel(submitLabelParam)
                        .font(.system(size:Constants.FontSizeCustom))
                        .frame(height: Constants.AlturaStandarTexfield)
                        .keyboardType(typeKeyBoardParam)
                        .textInputAutocapitalization(textInputAutocapitalizationParam)
                        .disabled(disable)
                        .focused($focusedField, equals: .field)
                        .onAppear {
                                    self.focusedField = .field
                                }
                        .onChange(of: valor) { newData in
                            //delegate?.changeCustomInputFormDelegate(IDControl: idControl ?? "")
                        }
                    }

                }
                
            }
            .padding(EdgeInsets(top: Constants.StandarMarginBetweenForm,
                                leading: Constants.StandarMarginSidesForm,
                                bottom: Constants.StandarMarginBetweenForm,
                                trailing: Constants.StandarMarginSidesForm)
            )
            .overlay(
                // Add the outline
                RoundedRectangle(cornerRadius: Constants.StandarCornerRadiusForm)
                    .stroke(colorLineaBorder, lineWidth: Constants.StandarWidthStrokeTextfieldForm - 0.3)
            )
            .background(disable ? Color(.systemGray5): Color.white)
            
        }
    }
}

//struct TextFieldViewCustom_Previews: PreviewProvider {
//    @State  var showPassword:String
//    static var previews: some View {
//
//        TextFieldViewCustom(placeholder: "", valor: $showPassword)
//    }
//}
