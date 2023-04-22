//
//  SwiftUIView.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 12/4/23.
//

import SwiftUI

struct CustomAlert: View {
    var screen = UIScreen.main.bounds.size
    
    var action: ()-> Void
    var back: (()-> Void)?
    var title: String
    var message: String
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 25){
                Text(title)
                    .foregroundColor(Colors.primary)
                    .font(.system(size: 23))
                    .padding(.top, 20)
                    .padding(.horizontal, 15)
                
                Text(message)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.horizontal)
                
                // MARK - double buttons
                if back != nil {
                    HStack {
                        Button(action: {
                            back!()
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
                        
                        
                        
                        Button(action: {
                            action()
                        }, label: {
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
                
                if  back == nil {
                    HStack {
                        Button(action: {
                            action()
                        }, label: {
                            Text("Continuar")
                                .padding(.horizontal, 35)
                                .padding(.vertical, 12)
                            
                        })
                        .frame(width: screen.width * 0.8)
                        .foregroundColor(.black)
                        .background(Colors.primary)
                        .cornerRadius(20)
                    }
                }
                
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
        CustomAlert(action: {}, title: "Xtitulo", message: "In SwiftUI, you can use an optional callback to handle user interactions or events that occur within a view. An optional callback is a closure that is passed as a parameter to a view and can be executed when an")
    }
}


struct BlurView : UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    
}
