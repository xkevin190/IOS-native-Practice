//
//  Register.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 16/4/23.
//

import SwiftUI

struct Register: View {
    @State var text: String = ""
    @EnvironmentObject var model: AuthViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                HeaderLoading(message: "Registrate")
                VStack() {
                    HStack {
                        Text("Ingresa tu correo")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .padding(.top, 40)
                            .padding(.leading, 30)
                    }
                    .frame(
                        width: UIScreen.main.bounds.width,
                        alignment: .leading
                    )
                    
                    Input(placeholder: "Correo electronico", TextError: model.authModel.emailPrompt, text: $model.authModel.email, icon: "envelope")
                    
                    AuthButton(callback: {
                        model.verifyEmailIsNoRegistered()
                    }, disabled: model.authModel.disabledButton()).padding()
                    Spacer()
                }
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height * 0.85,
                    alignment: .leading
                )
                .background(.white)
                .cornerRadius(30)
                
                if model.authModel.visbleAlert {
                    CustomAlert(action: {
                        model.foundMailWhenTryToRegister()
                        mode.wrappedValue.dismiss()
                    }, title: "Ya te encuentras registrado", message: "Tu correo se encuentra registrado, Vamos a inicio de sension")
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(
            isPresented: $model.navigateToQRoRCode) {
                QRorCodeRegister()
            }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HeaderButtonBack()
            }
        }
    }
    
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register().environmentObject(AuthViewModel())
    }
}
