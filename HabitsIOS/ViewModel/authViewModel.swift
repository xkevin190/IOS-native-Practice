//
//  authViewModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 31/3/23.
//

import Foundation


class AuthViewModel: ObservableObject {
    
    @Published var authModel = AuthModel.new
        
    
    func actionButton () {
        if authModel.step == 1 {
            changeStep(step: 2)
        } else {
            print("executed login")
        }
    }
    
    
   private func changeStep (step : Int) {
        authModel.step = 2
    }
    
}
