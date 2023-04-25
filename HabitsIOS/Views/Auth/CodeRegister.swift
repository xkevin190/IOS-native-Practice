//
//  CodeRegister.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 21/4/23.
//

import SwiftUI

struct CodeRegister: View {
    
    @ObservedObject var codeModel: CodeAuthViewModel
    @State var empresa = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView{
                firtView
                if codeModel.companyModel._id == nil {
                    secondView
                }
            }
            Spacer()
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    
    var firtView: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Infomarcion de registro")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .padding(.vertical, 15)
                Text("Busca el código en tu correo o en las instrucciones que recibista para ingresar a habits ").foregroundColor(.gray)
            }.padding(.horizontal, 20)
            
            Text("Codígo")
                .foregroundColor(.black)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Input(placeholder: "COD-123", TextError: "", text: $codeModel.code).padding(.top, -20)
                .onChange(of: codeModel.code) { newValue in
                    if(codeModel.codeToSend.count == 7) {
                        codeModel.verifyCode()
                    } else {
                        codeModel.modifyCode(newValue: newValue.uppercased())
                    }
            }
            
            
            Button(action: {}, label: {
                Text("No conoces tu codigo?")
                    .foregroundColor(.black)
                    .underline()
                    .padding(.horizontal, 20)
            })
        }
    }
    
    
    var secondView: some View {
        VStack() {
            VStack(alignment: .leading) {
                Text("Empresa")
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                
                Input(placeholder: "", TextError: "", text: $codeModel.companyModel.name).padding(.top, -20)
                
            }.onChange(of: codeModel.companyModel.name ) { _ in
               let result = codeModel.getItemsArea()

                print(result)
            }
            
            VStack(alignment:.leading) {
                Text("Area")
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                SelectOption(items: codeModel.getItemsArea()).padding(.top, -10)
                
            }
            
            VStack(alignment:.leading) {
                Text("Rango de edad")
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                SelectOption(items: codeModel.getItemsAge()).padding(.top, -10)
                
            }.padding(.bottom, 20)
            
            Button(action: {}, label: {
                Text("Continuar")
                    .foregroundColor(.white)
                    .padding()
                    
                
            })
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Colors.Background)
            .cornerRadius(20)
            
        }
    }
}

struct CodeRegister_Previews: PreviewProvider {
    static var previews: some View {
        CodeRegister(codeModel: CodeAuthViewModel())
    }
}
