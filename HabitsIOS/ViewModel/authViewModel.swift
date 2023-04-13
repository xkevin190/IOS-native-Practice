//
//  authViewModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 31/3/23.
//

import Foundation


class AuthViewModel: ObservableObject {
    
    @Published var authModel = AuthModel.new
    
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
    
    
    func verifyEmail () -> Void {
        
        let payload: NSDictionary = ["mail": authModel.email.lowercased() ]
        
        httpClient.sendRequest(url: "https://apiv2desarrollo.habits.ai/api/user/validateExistMail", method: "POST", body: payload , completion: { result in
            let data = try? result.get()
            if (data != nil) {
                self.changeStep(step: 2)
            } else {
                self.authModel.visbleAlert.toggle()
            }
        })
    }
    
}
