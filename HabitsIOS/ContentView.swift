//
//  ContentView.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 27/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Login().onTapGesture {
            UIApplication.shared.endEditing()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
