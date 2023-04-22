//
//  HeaderButtonBack.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 16/4/23.
//

import SwiftUI

struct HeaderButtonBack: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        Button {
            self.mode.wrappedValue.dismiss()
        } label: {
            // 4
            HStack {
                Image(systemName: "arrow.backward")
            }
        }
    }
}

struct HeaderButtonBack_Previews: PreviewProvider {
    static var previews: some View {
        HeaderButtonBack()
    }
}
