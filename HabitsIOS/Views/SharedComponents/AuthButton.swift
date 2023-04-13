//
//  AuthButton.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 28/3/23.
//

import SwiftUI

struct AuthButton: View {
        
       var callback: ()-> Void
       @State private var isPressed = false
       var buttonText: String = "Continuar"
       var buttonColor: Color = Color(hex: "#011223")
       var textColor: Color = .white
       var screen = UIScreen.main.bounds.size
       var disabled: Bool;
       
       var body: some View {
           Button(action: {
               callback()
           }) {
               
               ZStack(alignment: .trailing) {
                   
                   Text(buttonText)
                       .multilineTextAlignment(.leading)
                       .frame(width: screen.width * 0.85, alignment: .leading)
                       .foregroundColor(textColor)
                       .padding()
                       .background(disabled ? Color.gray : buttonColor)
                       .cornerRadius(30)
                   
                    Image(systemName: "chevron.right")
                       .foregroundColor( disabled ?  .black : .white )
                       .padding(.trailing)
                       
               }
           }.disabled(disabled)
        }}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        
        AuthButton(callback: {}, disabled: false)
    }
}
