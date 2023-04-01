//
//  Login.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 27/3/23.
//

import SwiftUI

struct Login: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            HeaderLoading();
            BodyLoading()
        }
    }
}

struct HeaderLoading:  View {
    var body: some View {
        let backgroundColor = Color(hex: "#011223")
        let uiScreen = UIScreen.main.bounds.size
            
        VStack {
            Text("Bienvenido a habits ✋")
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .padding(.top, 70)
            Spacer()
        }
        .frame(width: uiScreen.width, height: uiScreen.height)
        .background(backgroundColor)
    }
}


struct BodyLoading: View {
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    
 
    
    let placeholder = "Correo Electronico" 
    let uiScreen = UIScreen.main.bounds.size
    var body: some View {
        VStack() {
            Text("Inicia sesión con tu email y la contraseña que recibiste por correo. Su tienes un código de registro o un QR, Puedes dar click en el botón de abajo.")
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
                .font(.system(size: 18))
                .padding(.horizontal)
            
                    
            Input(placeholder: placeholder, error: false, TextError: "", text: $authViewModel.authModel.email)
            
            
            if authViewModel.authModel.step == 2 {
                Input(placeholder: "Ingresa tu contraseña", error: false, TextError: "", secure: true, text: $authViewModel.authModel.password)
            }
            
            
            AuthButton(callback: {
                authViewModel.actionButton()
            })
            
            Rectangle()
                .fill(.gray)
                .frame(width: uiScreen.width * 0.8, height: 1)
                .padding(.top, 50)
                .padding(.bottom,30)
            
            Text("Tiene un codigo de registro")
                .font(.system(size: 15))
                .foregroundColor(.gray)
            
            
            Button(action: {
                authViewModel.actionButton()
            }, label: {
                Text("Registrate aquí").font(.system(size: 16))
            })
            
            
            Button(action: {
                print("necesito ayuda")
            }, label: {
                
                HStack {
                    Text("Necesitas ayuda?").font(.system(size: 14))
                    
                    Image(systemName: "person.fill.questionmark")
                        .resizable()
                        .frame(width: 12, height: 12).padding(.leading, -2)
                }
            }).padding(.top)


            Spacer()
         
        }
        .frame(width: uiScreen.width, height: uiScreen.height * 0.8)
        .background(.white)
        .cornerRadius(30)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

