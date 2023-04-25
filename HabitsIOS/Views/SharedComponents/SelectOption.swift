//
//  SelectOption.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 22/4/23.
//

import SwiftUI

struct SelectOption: View {
    static var MockData: [String] = ["RH", "Other", "Other23","new Other", "bla", "black", "el MIo"]
    
    @State var ActivePicker = false
    @State var selected = MockData[0]
    
    var body: some View {
        
        Button(action: {
            ActivePicker = true
        }, label: {
            VStack{
                
                Text(selected).padding(.vertical, 10).foregroundColor(.black).padding(.leading)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .background(.gray.opacity(0.3))
            
            
        }).sheet(isPresented: $ActivePicker, content: {
            
            ScrollView(showsIndicators: false) {
                ForEach(SelectOption.MockData, id: \.self) { item in
                    var selectedColor = item == selected ? Color.gray : Color.white
                    
                    Button {
                        selected = item
                        ActivePicker = false
                    } label: {
                        VStack {
                            Text(item)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(selectedColor)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            Spacer().presentationDetents([.height(UIScreen.main.bounds.height / 4)])
        })
    }
}

struct SelectOption_Previews: PreviewProvider {
    static var previews: some View {
        SelectOption()
    }
}
