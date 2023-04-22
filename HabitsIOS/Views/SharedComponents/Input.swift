//
//  Input.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 28/3/23.
//

import SwiftUI

struct Input: View {
    var placeholder: String
    var TextError: String
    var Icon: String?
    var secure: Bool;
    
    @State var visiblePass: Bool
    @Binding var text: String
    
    
    
    init(placeholder: String, TextError: String, secure: Bool, text: Binding<String>) {
        self.placeholder = placeholder
        self.TextError = TextError
        _text = text
        self.secure = secure
        self.visiblePass = false;
    }
    
    
    init(placeholder: String, TextError: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.TextError = TextError
        _text = text
        self.secure = false
        self.visiblePass = true;
    }
    
    
    init(placeholder: String, TextError: String, text: Binding<String>, icon: String) {
        self.placeholder = placeholder
        self.TextError = TextError
        _text = text
        self.secure = false
        self.visiblePass = true;
        self.Icon = icon
    }
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            Rectangle()
                .fill(Color(hex: "#F6F6F6"))
                .frame(height: 50)
                .cornerRadius(100)
                .padding(.horizontal)
            
            HStack {
                ZStack (alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.leading, 30)
                            .padding(.bottom, -1)
                        
                        
                    }
                    
                    if !visiblePass {
                        SecureField("", text: $text)
                            .padding(.leading, 30)
                            .foregroundColor(.black)
                    } else {
                        TextField("", text: $text)
                            .padding(.leading, 30)
                            .foregroundColor(.black)
                        
                        
                    }
                    
                }
                
                if !secure && Icon != nil {
                    Image(systemName: Icon!)
                        .renderingMode(.template)
                        .padding(.trailing, 30)
                        .foregroundColor(.blue)
                } else if (secure) {
                    
                    Button(action: {
                        visiblePass.toggle()
                    }, label: {
                        
                        Image(systemName: visiblePass ? "eye.slash.fill" : "eye")
                            .renderingMode(.template)
                            .padding(.trailing, 30)
                            .foregroundColor(.blue)
                    })
                    
                }
                
                
            }
        }
        .padding(.top, 10)
        
        
        HStack {
            Spacer()
            Text(TextError)
                .font(.system(size: 12))
                .foregroundColor(.red)
                .padding(.trailing)
                .padding(.top, -2)
        }
    }
    
    
}

