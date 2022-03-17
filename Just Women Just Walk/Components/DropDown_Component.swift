//
//  DropDown_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/3/22.
//

import SwiftUI

struct DropDown_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var selected : String
    @Binding var choices : [String]
    @Binding var labelText: String
    
    @State var isOpen : Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(labelText)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Button(action: {
                self.isOpen.toggle()
            },
            label: {
                ZStack {
                    Text(selected)
                        .foregroundColor(.black)
                        .padding()
                    HStack {
                        Spacer()
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.black)
                        
                    }.padding(.trailing)
                }
            }
            ).background(
                RoundedRectangle(cornerRadius: uiConstants.buttonCornerRadius)
                    .stroke(uiConstants.dropDownbgColor, lineWidth: uiConstants.buttonLineWidth)
                    .background(uiConstants.dropDownbgColor)
                    .cornerRadius(uiConstants.buttonCornerRadius)
                    .frame(width: uiConstants.dropDownWidth, height: uiConstants.dropDownHeight)
            )
            if(isOpen) {
                ForEach (choices, id: \.self) { text in
                    Button(action: {
                        self.selected = text
                        self.isOpen = false
                    },
                    label: {
                        Text(text)
                            .foregroundColor(.black)
                            .padding()
                    }
                    ).background(
                        RoundedRectangle(cornerRadius: uiConstants.buttonCornerRadius)
                            .stroke(uiConstants.dropDownbgColor, lineWidth: uiConstants.buttonLineWidth)
                            .background(uiConstants.dropDownbgColor)
                            .cornerRadius(uiConstants.buttonCornerRadius)
                            .frame(width: uiConstants.dropDownWidth, height: uiConstants.dropDownHeight)
                    )
                }
            }
        }.padding()
    }
}

struct DropDown_Component_Previews: PreviewProvider {
    static var previews: some View {
        DropDown_Component(selected: .constant(""),
                           choices: .constant(["Choice A", "Choice B"]),
                           labelText: .constant("Label"))
            .environmentObject(UIConstants())
    }
}
