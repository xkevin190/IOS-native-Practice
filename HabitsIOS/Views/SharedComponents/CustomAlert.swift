//
//  SwiftUIView.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 12/4/23.
//

import SwiftUI

struct CustomAlert: View {
    var screen = UIScreen.main.bounds.size

    var email: String;
    var action: ()-> Void
    var body: some View {
        
        ZStack {
            VStack(spacing: 25){
                Text("No te encuentras registrado")
                    .foregroundColor(Colors.primary)
                    .font(.system(size: 23))
                    .padding(.top, 20)
                    .padding(.horizontal, 15)
                
                Text("Tu correo ''\(email)'' no se encuentra registrado. Verifica si es un correo corporativo o si tiene algún error. Tambien puedes registrarte si tiene un Código QR")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.horizontal)
                
    
                HStack {
                    Button(action: {
                        action()
                    }, label: {
                        Text("Regresar")
                            .padding(.horizontal, 35)
                            .padding(.vertical, 12)
                    })
                    .foregroundColor(Colors.primary)
                    .background(Colors.Background)
                    .cornerRadius(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Colors.primary, lineWidth: 1)
                    )
                    .padding(.leading, 20)
                    .padding(.trailing, 7)
                    
                    
                    
                    Button(action: {}, label: {
                        Text("Registrate")
                            .padding(.horizontal, 35)
                            .padding(.vertical, 12)
                        
                    })
                    .foregroundColor(.black)
                    .background(Colors.primary)
                    .padding(.trailing, 20)
                    .padding(.leading, 7)
                    .cornerRadius(3)
                }
                .padding(.bottom)
                
                
            }
            .frame(width: screen.width * 0.94)
            .padding(.vertical, 25)
            .background(Colors.card)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Colors.primary, lineWidth: 1)
            )
            
        }
        .frame(
            width: screen.width,
            height: screen.height
        )
        .background(.black.opacity(0.5))
        
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(email: "kevin@test.com", action: {})
    }
}


struct BlurView : UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
   
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    
}
