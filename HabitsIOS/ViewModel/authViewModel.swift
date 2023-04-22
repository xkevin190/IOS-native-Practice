//
//  authViewModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 31/3/23.
//

import Foundation


class AuthViewModel: ObservableObject {
    
    @Published var authModel = AuthModel.new
    @Published var navigateToRegister = false;
    @Published var navigateToQRoRCode = false;
    @Published var isPresentingQR = false
    @Published var isPresentingCode = false
    

    
    let httpClient:  HTTPClient = HTTPClient()
    
    
    func actionButton () {
        if authModel.step == 1 {
            verifyEmail()
        } else {
            print("executed login")
        }
    }
    
    
    private func changeStep (step : Int) {
        authModel.step = step
    }
    
    
    func showAlert () {
        authModel.visbleAlert.toggle()
    }
    
    
    func hideAlert () {
        authModel.visbleAlert = false;
    }
    
    
    func navigateToRegisterAction () {
        self.navigateToRegister = true;
        self.authModel.visbleAlert.toggle()
    }
    
    
    func foundMailWhenTryToRegister () {
        self.hideAlert()
        self.changeStep(step: 2);
    }
    
    private func verifyEmail (callback: @escaping (Result<Data?, Error>)-> Void) -> Void {
        let payload: NSDictionary = ["mail": authModel.email.lowercased() ]
        httpClient.sendRequest(url: "https://apiv2desarrollo.habits.ai/api/user/validateExistMail", method: "POST", body: payload , completion: callback)
    }
    
    func verifyEmail() {
        self.verifyEmail(callback:  { result in
            DispatchQueue.main.async {
                let data = try? result.get()
                if (data != nil) {
                    self.changeStep(step: 2)
                } else {
                    self.showAlert();
                }
            }
        })
    }
    
    func verifyEmailIsNoRegistered () {
        self.verifyEmail(callback:  { result in
            DispatchQueue.main.async {
                let data = try? result.get()
                if (data != nil) {
                    self.showAlert();
                } else {
                    self.navigateToQRoRCode = true
                }
            }
        })
    }
}
