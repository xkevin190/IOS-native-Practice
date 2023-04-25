//
//  QRorCodeRegister.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 19/4/23.
//

import SwiftUI
import CodeScanner

struct QRorCodeRegister: View {
    
    let Screen = UIScreen.main.bounds
    
    let sizeOFButtom = UIScreen.main.bounds.width / 2.5
    @EnvironmentObject var model: AuthViewModel
    @ObservedObject var  codeModel: CodeAuthViewModel = CodeAuthViewModel()
    
    
    var scannerSheet: some View {
        
        ZStack {
            CodeScannerView(codeTypes: [.qr], showViewfinder: true, completion: { result in
                print("result", result)
                if case let .success(code) = result {
                    model.isPresentingQR = false
                    print("code", code)
                }
            })
        }
    }
    
    
    var ChooseOption: some View {
        VStack {
            HStack {
                Text("Elige una opcion")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .padding(.top, 15)
                    .padding(.leading, 20)
                Spacer()
            }.padding(.top)
            
            HStack {
                Button(action: {
                    model.isPresentingCode = true
                    
                }, label: {
                    VStack {
                        Image("CodeImage")
                        Text("Tengo un codigo de registro").foregroundColor(.black)
                    }
                })
                .frame(width: sizeOFButtom, height: sizeOFButtom)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.leading, Screen.width * 0.05)
                
                Spacer()
                Button(action: {
                    model.isPresentingQR = true
                    
                }, label: {
                    VStack {
                        Image(systemName: "qrcode")
                            .font(.system(size: 50))
                            .padding(.bottom)
                            .foregroundColor(Colors.primary)
                        Text("Tengo un QR").foregroundColor(.black)
                    }
                })
                .frame(width: sizeOFButtom, height: sizeOFButtom)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.trailing, Screen.width  * 0.05)
                .sheet(isPresented: $model.isPresentingQR, content: {
                    self.scannerSheet
                })
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: Screen.height * 0.8, alignment: .top)
        .background(.white)
        .cornerRadius(20)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                HeaderLoading(message: "Registrate")
                if (!model.isPresentingCode) {
                    ChooseOption
                } else {
                    CodeRegister(codeModel: codeModel)
                        .frame(
                            height: Screen.height * 0.8
                        )
                        .background(.white)
                        .cornerRadius(20)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HeaderButtonBack()
                
            }
        }
    }
}

struct QRorCodeRegister_Previews: PreviewProvider {
    static var previews: some View {
        QRorCodeRegister().environmentObject(AuthViewModel())
    }
}
