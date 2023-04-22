//
//  CodeRegister.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 21/4/23.
//

import SwiftUI

struct CodeRegister: View {
    
    @State var text = ""
    var body: some View {
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
            
            Input(placeholder: "COD-123", TextError: "", text: $text).padding(.top, -20)
            
            Button(action: {}, label: {
                Text("No conoces tu codigo?")
                    .foregroundColor(.black)
                    .underline()
                    .padding(.horizontal, 20)
            })
            
            Spacer()
            
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct CodeRegister_Previews: PreviewProvider {
    static var previews: some View {
        CodeRegister()
    }
}
