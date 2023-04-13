//
//  AuthModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 31/3/23.
//

import Foundation
import SwiftUI



struct AuthModel {
    
    var email: String
    var password: String
    var step: Int
    var EmailError: Bool
    var visbleAlert: Bool;
    
    func isEmailValid() -> Bool {
           // criteria in regex.  See http://regexlib.com
           let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
           return emailTest.evaluate(with: email)
    }
    
    var emailPrompt: String {
        
        if email.isEmpty {
            return ""
        }
        
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    
    func disabledButton () -> Bool {
        if (step == 1 && isEmailValid()) {
            return false
        } else if (step == 2 && isEmailValid() && !password.isEmpty ){
            return false
        }
        return true
    }
    
    
    mutating func changeVisible () {
        visbleAlert.toggle()
    }
    
}


extension AuthModel {
        static var new: AuthModel {
            AuthModel(email: "", password: "" , step: 1, EmailError: false, visbleAlert: false)
        }
}
