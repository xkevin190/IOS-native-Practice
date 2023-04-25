//
//  SelectOption.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 22/4/23.
//

import SwiftUI

struct PickerModel: Hashable  {
   var id: String
   var label: String
}

struct SelectOption: View {
    var items: [PickerModel]
    @State var selected: PickerModel
    
    init(items: [PickerModel]) {
        self.items = items
        self.selected = items.count > 0 ? items[0] : PickerModel(id: "Selected", label: "Selected")
    }
    
    @State var ActivePicker = false
    
    
    var body: some View {
        
        Button(action: {
            ActivePicker = true
        }, label: {
            VStack{
                
                Text(selected.label).padding(.vertical, 10).foregroundColor(.black).padding(.leading)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .background(.gray.opacity(0.3))
            
            
        }).sheet(isPresented: $ActivePicker, content: {
            
            ScrollView(showsIndicators: false) {
                ForEach(self.items, id: \.self) { val in
                    let selectedColor = val.id == self.selected.id ? Color.gray : Color.white
                    
                    Button {
                        selected = val
                        ActivePicker = false
                    } label: {
                        VStack {
                            Text(val.label)
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
        SelectOption(items: [PickerModel(id: "test", label: "test")])
    }
}
