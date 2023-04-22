//
//  Login.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 27/3/23.
//

import SwiftUI

struct Login: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var authViewModel = AuthViewModel()
    
    var titleAlert = "No te encuentras registrado"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                HeaderLoading(message: "Bienvenido a habis ✋");
                BodyLoading(viewModel: authViewModel)
                if authViewModel.authModel.visbleAlert {
                    CustomAlert(action: {
                        authViewModel.navigateToRegisterAction()
                    },back: {
                        authViewModel.hideAlert()
                    }, title: titleAlert, message: "Tu correo ''\(authViewModel.authModel.email)'' no se encuentra registrado. Verifica si es un correo corporativo o si tiene algún error. Tambien puedes registrarte si tiene un Código QR" )
                    .navigationDestination(
                        isPresented: $authViewModel.navigateToRegister) {
                            Register()
                        }
                }
            }
        }
        .environmentObject(authViewModel)
    }
}

struct HeaderLoading:  View {
    var message: String
    var body: some View {
        let backgroundColor = Color(hex: "#011223")
        let uiScreen = UIScreen.main.bounds.size
        
        VStack {
            Text(message)
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
    
    @ObservedObject var viewModel: AuthViewModel;
    let placeholder = "Correo Electronico" 
    let uiScreen = UIScreen.main.bounds.size
    
    var body: some View {
        ZStack {
            VStack() {
                Text("Inicia sesión con tu email y la contraseña que recibiste por correo. Su tienes un código de registro o un QR, Puedes dar click en el botón de abajo.")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .font(.system(size: 18))
                    .padding(.horizontal)
                
                
                Input(placeholder: placeholder, TextError: viewModel.authModel.emailPrompt, text: $viewModel.authModel.email, icon: "envelope")
                
                
                if viewModel.authModel.step == 2 {
                    Input(placeholder: "Ingresa tu contraseña", TextError: "", secure: true, text: $viewModel.authModel.password)
                }
                
                AuthButton(callback: {
                    viewModel.verifyEmail()
                }, disabled: viewModel.authModel.disabledButton()).padding()
                
                Rectangle()
                    .fill(.gray)
                    .frame(width: uiScreen.width * 0.8, height: 1)
                    .padding(.top, 50)
                    .padding(.bottom,30)
                
                Text("Tiene un codigo de registro")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                
                NavigationLink(destination: Register()) {
                    Text("Registrate aquí").font(.system(size: 16))
                }
                .onDisappear(perform: {
                    print("new changes!!!!! back")
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
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

