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

}


extension AuthModel {
    static var new: AuthModel{
            AuthModel(email: "", password: "" , step: 1)
        }
}
